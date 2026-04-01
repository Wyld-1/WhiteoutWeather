/* WeatherViewModel.swift
 * White Weather
 *
 * Observable state for a single location page. Owns the fetch lifecycle,
 * background image selection, and hourly windowing.
 * One instance per LocationPageView — not shared across pages.
 */

import Foundation
import CoreLocation
import Observation
import MapKit
import SwiftUI

// MARK: - WeatherViewModel

@Observable
@MainActor
final class WeatherViewModel {
    private var lastFetchTime: Date?
    private var lastFetchedCoordinate: CLLocationCoordinate2D?

    var current: CurrentConditions?
    var daily: [DailyForecast] = []
    var hourly: [HourlyForecast] = []
    var sunEvent: SunEvent?

    var locationName: String = ""
    var weatherCondition: WeatherCondition = .clear
    private var utcOffsetSeconds: Int = 0

    // Current time-of-day slot — computed live from sunEvent so it stays accurate
    // as the day progresses without needing a re-fetch.
    var weatherTimeOfDay: WeatherTimeOfDay {
        // If we have a cached isDay value but no sunEvent yet (warm-start),
        // use it so the background doesn't flash to .day incorrectly.
        if sunEvent == nil, let cur = current {
            return WeatherTimeOfDay.from(isDay: cur.isDay)
        }
        return WeatherTimeOfDay.from(sun: sunEvent, utcOffsetSeconds: utcOffsetSeconds)
    }

    // Whether the current background is perceptually light-colored.
    // Used by PageDotsView to switch dot/icon color for legibility.
    var isLightBackground: Bool {
        switch weatherCondition {
        case .snow:    return true
        case .clear, .mostlyClear:
            // Day clear is bright blue — dark dots needed.
            // Night/sunrise clear is dark — white dots fine.
            return weatherTimeOfDay == .day
        default:       return false
        }
    }

    var isLoading = false
    var isSkiResort = false
    var isCurrentLocation = false  // true for the GPS page; drives the location.fill icon in the header
    var errorMessage: String?

    var globalLow: Double = 0
    var globalHigh: Double = 100
    var dailyHigh: Double? { daily.first?.high }
    var dailyLow: Double?  { daily.first?.low }

    /* Populates minimal display state from cached widget data without a network fetch.
     * Called immediately on deep link open so the header renders while fresh data loads.
     * The full load() call replaces this a moment later.
     *
     * @param id  location ID ("current" or a SavedLocation UUID string)
     */
    func loadFromCache(id: String) {
        guard let cached = WidgetWeatherData.load(id: id) else { return }

        if locationName.isEmpty {
            locationName = cached.locationName
        }

        // Only update the condition if the cache has a real condition string.
        if let cond = WeatherCondition.fromCondition(cached.condition) {
            weatherCondition = cond
        }
        current = CurrentConditions(
            temperature:        cached.temperature,
            description:        cached.condition,
            windSpeed:          0,
            windGusts:          cached.windGusts ?? 0,
            windDirection:      0,
            windDirectionLabel: "",
            humidity:           0,
            weatherCode:        0,
            isDay:              cached.isDay
        )
    }

    /* Fetches weather data for a coordinate and updates all published state.
     * Skips the fetch if the same coordinate was loaded less than 15 minutes ago,
     * unless forceRefresh is true.
     *
     * @param coordinate   location to fetch
     * @param locationID   "current" or a SavedLocation UUID string (used for widget data keying)
     * @param skipGeocode  true for saved locations whose name is already known
     * @param forceRefresh bypasses the 15-minute staleness check
     */
    func load(
        coordinate: CLLocationCoordinate2D,
        locationID: String? = nil,
        skipGeocode: Bool = false,
        forceRefresh: Bool = false
    ) async {
        if !forceRefresh,
           let last = lastFetchedCoordinate,
           abs(last.latitude  - coordinate.latitude)  < 0.01,
           abs(last.longitude - coordinate.longitude) < 0.01,
           let lastFetch = lastFetchTime,
           Date().timeIntervalSince(lastFetch) < 900 { return }

        lastFetchedCoordinate = coordinate
        isLoading = true
        errorMessage = nil

        // For the current location (skipGeocode=false), always geocode — the coordinate
        // may have changed since the cached name was written, and we never want to show
        // a stale city name from a different location.
        // For saved locations (skipGeocode=true), the name is already correct from LocationStore.
        if !skipGeocode {
            Task { await geocodeLocationName(for: coordinate) }
        }

        do {
            let (cur, days, allHourly, sun, scraped, utcOffset) = try await WeatherRepository.shared.fetchAll(
                lat: coordinate.latitude,
                lon: coordinate.longitude
            )

            current  = cur
            daily    = days
            sunEvent = sun
            hourly   = hourlyWindow(from: allHourly)

            // Prefer the NOAA tombstone for the current period (day or night).
            // At night, dayCondition is gone — fall through to nightCondition,
            // then to WMO. This prevents a clear-day tombstone from persisting
            // into the evening and picking the wrong gradient.
            let todayData = scraped[todayKey()]
            let noaaCond: WeatherCondition?
            if cur.isDay {
                noaaCond = WeatherCondition.fromCondition(todayData?.dayCondition ?? "")
            } else {
                noaaCond = WeatherCondition.fromCondition(todayData?.nightCondition ?? "")
                       ?? WeatherCondition.fromCondition(todayData?.dayCondition ?? "")
            }
            weatherCondition = noaaCond ?? WeatherCondition.fromWMO(code: cur.weatherCode)
            utcOffsetSeconds = utcOffset

            calculateGlobalBounds(days: days)
            saveCoordinates(id: locationID ?? "current", coord: coordinate)

            isLoading = false
            lastFetchTime = Date()

        } catch {
            errorMessage = "Failed to load weather: \(error.localizedDescription)"
            isLoading = false
        }
    }

    func setLocationName(_ name: String) { locationName = name }
    func setSkiResort(_ value: Bool)     { isSkiResort = value }

    // MARK: Private

    /* Filters all hourly data to the window from the current clock-hour through current hour + 12. */
    private func hourlyWindow(from all: [HourlyForecast]) -> [HourlyForecast] {
        let cal = Calendar.current
        let now = Date()
        let start = cal.date(from: cal.dateComponents([.year, .month, .day, .hour], from: now)) ?? now
        let end   = start.addingTimeInterval(12 * 3600)
        return all.filter { $0.time >= start && $0.time <= end }
    }

    private func todayKey() -> String {
        let f = DateFormatter(); f.dateFormat = "yyyy-MM-dd"; return f.string(from: Date())
    }

    private func calculateGlobalBounds(days: [DailyForecast]) {
        guard let minLow  = days.map({ $0.low  }).min(),
              let maxHigh = days.map({ $0.high }).max() else { return }
        globalLow  = (minLow  - 2).rounded(.down)
        globalHigh = (maxHigh + 2).rounded(.up)
    }

    /* Uses CLGeocoder to reverse-geocode to the nearest city/town name.
     * Always shows a city name for the current location page — never a POI or "My Location".
     *
     * @param coord  coordinate to reverse-geocode
     */
    private func geocodeLocationName(for coord: CLLocationCoordinate2D) async {
        let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let geocoder = CLGeocoder()
        guard let placemark = try? await geocoder.reverseGeocodeLocation(location).first else {
            if locationName.isEmpty { locationName = "Unknown" }
            return
        }
        let city  = placemark.locality ?? ""
        let state = placemark.administrativeArea ?? ""
        locationName = city.isEmpty ? state : city
        // Propagate the freshly-geocoded name to the widget's App Group so it
        // always reflects the real current location, not a stale cached city.
        saveCoordinates(id: "current", coord: coord)
    }

    /* Writes this location's coordinate to the shared App Group container
     * so the widget can re-fetch independently without the app being open.
     *
     * For the current GPS location (id == "current") the name is written to a
     * dedicated key rather than the shared saved_location_names dictionary.
     * This eliminates the read-modify-write race where concurrent saved-location
     * fetches clobber the "current" entry in the shared dict.
     */
    private func saveCoordinates(id: String, coord: CLLocationCoordinate2D) {
        guard let defaults = UserDefaults(suiteName: WidgetWeatherData.groupID) else { return }
        var coords = defaults.dictionary(forKey: "saved_location_coords") as? [String: String] ?? [:]
        coords[id] = "\(coord.latitude),\(coord.longitude)"
        defaults.set(coords, forKey: "saved_location_coords")

        if id == "current" {
            // Dedicated key — never touched by LocationStore or saved-location fetches.
            defaults.set(locationName, forKey: "current_location_name")
        } else {
            // Saved locations: write into the shared dict as before.
            // LocationStore.syncLocationRegistry() also manages this dict.
            var names = defaults.dictionary(forKey: "saved_location_names") as? [String: String] ?? [:]
            names[id] = locationName
            defaults.set(names, forKey: "saved_location_names")
        }
    }
}
