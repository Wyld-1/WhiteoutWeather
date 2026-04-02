/* AppSettings.swift
 * White Weather
 *
 * Single source of truth for user preferences.
 * Reads and writes to UserDefaults.standard (the container System Settings uses).
 * Also mirrors values to the shared App Group container so the widget can read them.
 */

import Foundation
import Combine
import UIKit
import WidgetKit

// MARK: - Haptics

/* Thin wrapper around UIImpactFeedbackGenerator and UINotificationFeedbackGenerator.
 * Call Haptics.shared.impact() or .notification() from any view.
 * Generators are prepared lazily and reused to minimise latency.
 */
final class Haptics {
    static let shared = Haptics()
    private let light   = UIImpactFeedbackGenerator(style: .light)
    private let medium  = UIImpactFeedbackGenerator(style: .medium)
    private let rigid   = UIImpactFeedbackGenerator(style: .rigid)
    private let notif   = UINotificationFeedbackGenerator()

    private init() {
        light.prepare(); medium.prepare(); rigid.prepare(); notif.prepare()
    }

    func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        switch style {
        case .light:  light.prepare();  light.impactOccurred()
        case .rigid:  rigid.prepare();  rigid.impactOccurred()
        default:      medium.prepare(); medium.impactOccurred()
        }
    }

    func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        notif.prepare()
        notif.notificationOccurred(type)
    }
}

enum UnitSystem: String {
    case us     = "us"      // °F, mph, inches
    case metric = "metric"  // °C, kph, cm
}

enum TimeFormat: String {
    case twelve     = "12"
    case twentyFour = "24"
}

/* Observable settings container. Use AppSettings.shared everywhere.
 * Observe via Combine — don't listen to UserDefaults.didChangeNotification,
 * as that fires for every UserDefaults write in the app and causes runaway loops.
 */
final class AppSettings: ObservableObject {
    static let shared = AppSettings()

    private let unitKey = "unitSystem"
    private let timeKey = "timeFormat"
    private let groupID = "group.weather.widgetinfo"

    @Published var unitSystem: UnitSystem {
        didSet {
            UserDefaults.standard.set(unitSystem.rawValue, forKey: unitKey)
            mirrorToAppGroup()
        }
    }

    @Published var timeFormat: TimeFormat {
        didSet {
            UserDefaults.standard.set(timeFormat.rawValue, forKey: timeKey)
            mirrorToAppGroup()
        }
    }

    var isMetric: Bool { unitSystem == .metric }
    var is24Hour: Bool { timeFormat == .twentyFour }

    private init() {
        // The widget extension cannot access UserDefaults.standard from the main app.
        // Read from the App Group container (the mirror target), falling back to standard.
        // In the main app, standard is the source of truth; the widget reads the mirror.
        let standard  = UserDefaults.standard
        let appGroup  = UserDefaults(suiteName: groupID)
        let source    = appGroup ?? standard

        let savedUnit = source.string(forKey: "unitSystem") ?? standard.string(forKey: "unitSystem") ?? "us"
        let savedTime = source.string(forKey: "timeFormat") ?? standard.string(forKey: "timeFormat") ?? "12"
        self.unitSystem = UnitSystem(rawValue: savedUnit) ?? .us
        self.timeFormat = TimeFormat(rawValue: savedTime) ?? .twelve
    }

    /* Syncs current settings to the App Group container so the widget can read them.
     * Also invalidates widget timelines so the next render uses the new unit system.
     */
    private func mirrorToAppGroup() {
        guard let groupDefaults = UserDefaults(suiteName: groupID) else { return }
        groupDefaults.set(unitSystem.rawValue, forKey: unitKey)
        groupDefaults.set(timeFormat.rawValue, forKey: timeKey)
        WidgetCenter.shared.reloadAllTimelines()
    }

    /* Called on app foreground to pick up any changes made in System Settings while suspended.
     * Also handles the DEBUG reset trigger toggle.
     * Only fires the Combine publisher (and thus a re-fetch) if a value actually changed.
     */
    func syncFromStandard() {
        let savedUnit = UserDefaults.standard.string(forKey: unitKey) ?? "us"
        let savedTime = UserDefaults.standard.string(forKey: timeKey) ?? "12"
        let newUnit = UnitSystem(rawValue: savedUnit) ?? .us
        let newTime = TimeFormat(rawValue: savedTime) ?? .twelve
        if newUnit != unitSystem { unitSystem = newUnit }
        if newTime != timeFormat { timeFormat = newTime }
    }

    #if DEBUG
    /* Returns true and resets the trigger if the debug reset toggle was flipped in System Settings. */
    var debugResetWasTriggered: Bool {
        guard UserDefaults.standard.bool(forKey: "debugResetTrigger") else { return false }
        UserDefaults.standard.set(false, forKey: "debugResetTrigger")
        return true
    }
    #endif
}

// MARK: - Unit Conversion Helpers

extension AppSettings {
    /* Converts a temperature from °F to °C if metric is active. */
    func temperature(_ fahrenheit: Double) -> Double {
        isMetric ? (fahrenheit - 32) * 5 / 9 : fahrenheit
    }

    /* Converts a wind speed from mph to kph if metric is active. */
    func windSpeed(_ mph: Double) -> Double {
        isMetric ? mph * 1.60934 : mph
    }

    /* Converts an accumulation bound from inches to cm if metric is active. */
    func accumulation(_ inches: Double?) -> Double? {
        guard let v = inches else { return nil }
        return isMetric ? v * 2.54 : v
    }

    var tempUnit: String  { isMetric ? "°C" : "°F" }
    var windUnit: String  { isMetric ? "kph" : "mph" }
    var accumUnit: String { isMetric ? "cm" : "\"" }

    func timeFormatter(format base: String = "h:mm a") -> DateFormatter {
        let f = DateFormatter()
        f.dateFormat = is24Hour ? base.replacingOccurrences(of: "h:mm a", with: "HH:mm") : base
        return f
    }
}
