/* LocationManager.swift
 * Whiteout Weather
 *
 * Thin CoreLocation wrapper that publishes the user's current coordinate.
 * Requests kilometer-level accuracy — sufficient for weather and avoids
 * triggering the high-accuracy location prompt.
 *
 * Uses startUpdatingLocation/stopUpdatingLocation rather than the one-shot
 * requestLocation() API, which can silently fail to deliver when the system
 * believes it already has a recent enough fix — causing the current-location
 * page to hang on the loading graphic indefinitely.
 */

internal import CoreLocation
import Combine

@Observable
final class LocationManager: NSObject, CLLocationManagerDelegate {

    var coordinate: CLLocationCoordinate2D?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var locationError: Error?

    private let manager = CLLocationManager()
    // Guards against acting on stale cached fixes (>5 min old).
    private let maxLocationAge: TimeInterval = 300

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    /* Starts a location update session, or prompts for permission if not yet
     * determined. Stops updating as soon as the first acceptable fix arrives.
     * This is more reliable than requestLocation(), which can silently drop
     * the request when the OS thinks a cached fix is still valid.
     */
    func requestLocation() {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        // Reject fixes that are too old — the OS sometimes delivers a cached
        // fix from minutes ago, which would prevent a fresh fetch from firing.
        let age = -location.timestamp.timeIntervalSinceNow
        guard age < maxLocationAge else { return }
        manager.stopUpdatingLocation()
        coordinate = location.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        // kCLErrorLocationUnknown is transient — the manager will keep trying
        // if we don't stop it. Stop and surface the error.
        locationError = error
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse ||
           manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
