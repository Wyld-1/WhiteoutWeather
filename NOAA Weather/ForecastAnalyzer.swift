// ForecastAnalyzer.swift
// White Weather
//
// Foundation Model: isNightSevere and precipType only.
// Accumulation is handled by regex in NOAAScraper (more reliable for numeric extraction).
// SF symbols are derived from NOAA condition strings in noaaSFSymbol().

import Foundation
import FoundationModels

// MARK: - PrecipType (used by model + regex fallback)

@Generable
enum PrecipType: String {
    case snow
    case rain
    case mixed  // rain and snow both mentioned
    case none
}

// MARK: - Model schema

@Generable
struct PeriodAnalysis {

    @Guide(description: "Precipitation type explicitly stated in the text. 'mixed' if both rain and snow are mentioned. 'none' if no precipitation.")
    var precipType: PrecipType

    @Guide(description: """
        True if the day and night weather are notably different from each other in a way a person would care about.
        This includes BOTH directions — severe day with calm night, OR calm day with severe night.

        True examples:
        - Sunny/clear day, then heavy snow or thunderstorm at night
        - Heavy snow or blizzard during the day, then clear at night
        - Calm day, then dense fog at night
        - Any day period, then thunderstorm at night

        False examples:
        - Partly cloudy day, then mostly cloudy night
        - Similar precipitation type and intensity day and night
        - Any "chance of" light precipitation in either period
        - Cloudy day, then cloudy night

        Default false. Only true when the contrast is striking and meaningful.
        """)
    var isNightSevere: Bool
}

// MARK: - AccumulationRange
// Holds numeric bounds. Display formatting lives here, not in the model or regex.

struct AccumulationRange {
    let low: Double?   // nil = no lower bound ("less than X")
    let high: Double?  // nil = no upper bound ("more than X")

    var hasAccumulation: Bool { low != nil || high != nil }

    var displayString: String {
        switch (low, high) {
        case (nil, nil):              return ""
        case (nil, let h?):           return "< \(fmt(h))\""
        case (let l?, nil):           return "> \(fmt(l))\""
        case (let l?, let h?) where l == h: return "~\(fmt(l))\""
        case (let l?, let h?):        return "\(fmt(l))–\(fmt(h))\""
        }
    }

    private func fmt(_ v: Double) -> String {
        v.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(v)) : String(format: "%.1f", v)
    }

    static func merge(_ a: AccumulationRange, _ b: AccumulationRange) -> AccumulationRange {
        guard a.hasAccumulation || b.hasAccumulation else { return .none }
        let lo = max(a.low  ?? 0, b.low  ?? 0)
        let hi = max(a.high ?? 0, b.high ?? 0)
        return AccumulationRange(low: lo > 0 ? lo : nil, high: hi > 0 ? hi : nil)
    }

    static var none: AccumulationRange { AccumulationRange(low: nil, high: nil) }
}

// MARK: - Analyzer (model: precipType + isNightSevere only)

actor ForecastAnalyzer {
    static let shared = ForecastAnalyzer()

    private let instructions = """
        You analyze NOAA weather forecast text.
        Report only what is explicitly stated. Never infer or assume.
        """

    func analyze(dayProse: String, nightProse: String) async -> PeriodAnalysis? {
        guard SystemLanguageModel.default.availability == .available else { return nil }

        let combined = nightProse.isEmpty
            ? "Day: \(dayProse)"
            : "Day: \(dayProse)\n\nNight: \(nightProse)"

        let session = LanguageModelSession(instructions: instructions)
        do {
            let response = try await session.respond(
                to: combined,
                generating: PeriodAnalysis.self,
                options: GenerationOptions(sampling: .greedy)
            )
            return response.content
        } catch {
            print("[ForecastAnalyzer] \(error.localizedDescription)")
            return nil
        }
    }
}

// MARK: - NOAA condition string → SF Symbol
// Maps the vocabulary NOAA uses in tombstone <img title=""> attributes.
// Call this with the condition string. Falls back to WMO code if condition is empty.

nonisolated func noaaSFSymbol(condition: String, isDay: Bool) -> String? {
    let c = condition.lowercased()
    guard !c.isEmpty else { return nil }

    // NOAA often uses "X then Y" for transitional days (e.g. "Chance Snow then Mostly Sunny").
    // When "then" is present, the condition AFTER "then" is the dominant/afternoon state.
    // Split on "then" and evaluate the latter half first, then fall back to the full string.
    let parts = c.components(separatedBy: " then ")
    let dominant = parts.count > 1 ? parts.last! : c

    // Evaluate a single condition string against all known patterns
    func symbol(for s: String) -> String? {
        // Thunder — highest priority
        if s.contains("thunder") || s.contains("tstm")          { return "cloud.bolt.rain.fill" }

        // Freezing / ice
        if s.contains("freezing rain") || s.contains("fzra")    { return "cloud.sleet.fill" }
        if s.contains("freezing drizzle") || s.contains("fzdz") { return "cloud.sleet.fill" }
        if s.contains("sleet") || s.contains("ice pellet")      { return "cloud.sleet.fill" }

        // Snow varieties (check compound forms before plain "snow")
        if s.contains("blizzard")                                { return "wind.snow" }
        if s.contains("heavy snow")                              { return "wind.snow" }
        if s.contains("blowing snow") || s.contains("drifting snow") { return "wind.snow" }
        if s.contains("snow shower") || s.contains("snow showers") { return "cloud.snow.fill" }
        if s.contains("flurr")                                   { return "cloud.snow.fill" }
        if s.contains("wintry mix") || s.contains("rain/snow") ||
           s.contains("rain and snow") || s.contains("snow and rain") { return "cloud.sleet.fill" }
        if s.contains("snow")                                    { return "cloud.snow.fill" }

        // Rain varieties
        if s.contains("heavy rain")                              { return "cloud.heavyrain.fill" }
        if s.contains("rain shower") || s.contains("shower")    {
            return isDay ? "cloud.sun.rain.fill" : "cloud.moon.rain.fill"
        }
        if s.contains("drizzle")                                 { return "cloud.drizzle.fill" }
        if s.contains("rain")                                    { return "cloud.rain.fill" }

        // Fog / smoke / haze
        if s.contains("dense fog") || s.contains("patchy fog")  { return "cloud.fog.fill" }
        if s.contains("fog") || s.contains("mist")              { return "cloud.fog.fill" }
        if s.contains("haze") || s.contains("smoke") || s.contains("dust") { return "sun.haze.fill" }

        // Wind-only
        if s.contains("breezy") || s.contains("windy") || s.contains("blustery") { return "wind" }

        // Sunny / clear (partly before mostly before plain)
        if s.contains("partly sunny") || s.contains("partly cloudy") {
            return isDay ? "cloud.sun.fill" : "cloud.moon.fill"
        }
        if s.contains("mostly sunny") || s.contains("mostly clear") {
            return isDay ? "sun.max.fill" : "moon.stars.fill"
        }
        if s.contains("sunny") || s.contains("clear") || s.contains("fair") {
            return isDay ? "sun.max.fill" : "moon.stars.fill"
        }

        // Cloudy
        if s.contains("mostly cloudy") || s.contains("considerable cloudiness") {
            return isDay ? "cloud.sun.fill" : "cloud.moon.fill"
        }
        if s.contains("cloudy") || s.contains("overcast") || s.contains("increasing clouds") {
            return "cloud.fill"
        }

        return nil
    }

    // Try dominant (post-"then") condition first, fall back to full string
    return symbol(for: dominant) ?? (parts.count > 1 ? symbol(for: c) : nil)
}
