import SwiftUI

// MARK: - WeatherGradientColors

/* Shared gradient data compiled into both the app and widget targets.
 *
 * Defines colors for every WeatherCondition × WeatherTimeOfDay combination.
 * Both targets call weatherGradientColors(condition:timeOfDay:) to get the
 * same [Color] array, then render it in a format-appropriate way:
 *   • App  — full-screen LinearGradient in GradientBackgroundView
 *   • Widget — containerBackground LinearGradient in WidgetBackground
 *
 * ADD THIS FILE TO BOTH TARGET MEMBERSHIPS IN XCODE:
 *   NOAA Weather target ✓
 *   wildcat.NOAA-Weather.widgets target ✓
 */

/* Returns the gradient color stops for a condition + time-of-day pair.
 * Colors are ordered top → bottom (use .top / .bottom as gradient points).
 *
 * Fog maps to overcast. Wind is not used (caller should map it before calling).
 */
func weatherGradientColors(condition: WeatherCondition, timeOfDay: WeatherTimeOfDay) -> [Color] {
    switch timeOfDay {

    // -------------------------------------------------------------------------
    // DAY
    // -------------------------------------------------------------------------
    case .day:
        switch condition {
        case .clear:
            // Vivid alpine blue sky, brighter at top
            return [
                Color(red: 0.18, green: 0.52, blue: 0.92),
                Color(red: 0.42, green: 0.73, blue: 0.98),
                Color(red: 0.72, green: 0.88, blue: 1.00),
            ]
        case .mostlyClear:
            // Blue sky with a touch of haze / light cloud
            return [
                Color(red: 0.25, green: 0.58, blue: 0.90),
                Color(red: 0.52, green: 0.76, blue: 0.96),
                Color(red: 0.80, green: 0.90, blue: 0.98),
            ]
        case .overcast, .fog:
            // Steel blue-grey, flat and muted
            return [
                Color(red: 0.36, green: 0.42, blue: 0.52),
                Color(red: 0.52, green: 0.58, blue: 0.66),
                Color(red: 0.68, green: 0.72, blue: 0.76),
            ]
        case .rain:
            // Dark stormy blue-grey
            return [
                Color(red: 0.14, green: 0.20, blue: 0.32),
                Color(red: 0.24, green: 0.32, blue: 0.46),
                Color(red: 0.38, green: 0.46, blue: 0.58),
            ]
        case .snow:
            // Cold pale silver-white
            return [
                Color(red: 0.62, green: 0.70, blue: 0.80),
                Color(red: 0.78, green: 0.84, blue: 0.90),
                Color(red: 0.90, green: 0.93, blue: 0.97),
            ]
        case .thunderstorm:
            // Near-black purple-green bruise
            return [
                Color(red: 0.06, green: 0.06, blue: 0.14),
                Color(red: 0.12, green: 0.16, blue: 0.28),
                Color(red: 0.22, green: 0.28, blue: 0.38),
            ]
        case .wind:
            // Same as mostlyClear — wind has no distinct look
            return weatherGradientColors(condition: .mostlyClear, timeOfDay: .day)
        }

    // -------------------------------------------------------------------------
    // NIGHT
    // -------------------------------------------------------------------------
    case .night:
        switch condition {
        case .clear:
            // Deep midnight navy, nearly black at top
            return [
                Color(red: 0.02, green: 0.04, blue: 0.14),
                Color(red: 0.06, green: 0.10, blue: 0.26),
                Color(red: 0.10, green: 0.16, blue: 0.36),
            ]
        case .mostlyClear:
            // Indigo-navy with a hint of lighter horizon
            return [
                Color(red: 0.04, green: 0.06, blue: 0.20),
                Color(red: 0.10, green: 0.14, blue: 0.32),
                Color(red: 0.18, green: 0.22, blue: 0.44),
            ]
        case .overcast, .fog:
            // Dark charcoal, very desaturated
            return [
                Color(red: 0.08, green: 0.09, blue: 0.12),
                Color(red: 0.14, green: 0.16, blue: 0.20),
                Color(red: 0.22, green: 0.24, blue: 0.28),
            ]
        case .rain:
            // Almost black with cold blue undertone
            return [
                Color(red: 0.05, green: 0.07, blue: 0.14),
                Color(red: 0.10, green: 0.14, blue: 0.24),
                Color(red: 0.18, green: 0.22, blue: 0.34),
            ]
        case .snow:
            // Very dark grey-blue, snow diffuses ambient light
            return [
                Color(red: 0.10, green: 0.12, blue: 0.18),
                Color(red: 0.18, green: 0.22, blue: 0.30),
                Color(red: 0.30, green: 0.34, blue: 0.44),
            ]
        case .thunderstorm:
            // Oppressive near-black with deep purple tinge
            return [
                Color(red: 0.03, green: 0.02, blue: 0.08),
                Color(red: 0.08, green: 0.06, blue: 0.18),
                Color(red: 0.14, green: 0.12, blue: 0.28),
            ]
        case .wind:
            return weatherGradientColors(condition: .mostlyClear, timeOfDay: .night)
        }

    // -------------------------------------------------------------------------
    // SUNRISE / SUNSET
    // -------------------------------------------------------------------------
    case .sunrise:
        switch condition {
        case .clear:
            // Classic amber → peach → pale blue horizon
            return [
                Color(red: 0.88, green: 0.44, blue: 0.12),
                Color(red: 0.96, green: 0.66, blue: 0.28),
                Color(red: 0.99, green: 0.86, blue: 0.62),
            ]
        case .mostlyClear:
            // Warmer pink-peach with some cloud softness
            return [
                Color(red: 0.80, green: 0.36, blue: 0.28),
                Color(red: 0.94, green: 0.60, blue: 0.38),
                Color(red: 0.99, green: 0.82, blue: 0.68),
            ]
        case .overcast, .fog:
            // Muted mauve-grey, sun can’t break through
            return [
                Color(red: 0.38, green: 0.32, blue: 0.38),
                Color(red: 0.56, green: 0.50, blue: 0.54),
                Color(red: 0.74, green: 0.70, blue: 0.72),
            ]
        case .rain:
            // Dark teal-grey, cold and wet at dawn
            return [
                Color(red: 0.16, green: 0.24, blue: 0.34),
                Color(red: 0.28, green: 0.38, blue: 0.48),
                Color(red: 0.44, green: 0.54, blue: 0.62),
            ]
        case .snow:
            // Pale lavender-white, cold diffuse light
            return [
                Color(red: 0.54, green: 0.54, blue: 0.68),
                Color(red: 0.74, green: 0.74, blue: 0.84),
                Color(red: 0.90, green: 0.90, blue: 0.96),
            ]
        case .thunderstorm:
            // Bruised amber-purple, storm at sunrise
            return [
                Color(red: 0.22, green: 0.10, blue: 0.18),
                Color(red: 0.46, green: 0.22, blue: 0.18),
                Color(red: 0.72, green: 0.44, blue: 0.22),
            ]
        case .wind:
            return weatherGradientColors(condition: .mostlyClear, timeOfDay: .sunrise)
        }
    }
}

// MARK: - GradientBackgroundView
// App-side renderer. Replace ImageBackgroundView usage with this.

struct GradientBackgroundView: View {
    let condition: WeatherCondition
    let timeOfDay: WeatherTimeOfDay

    private var colors: [Color] {
        weatherGradientColors(condition: condition, timeOfDay: timeOfDay)
    }

    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 1.2), value: condition.assetSuffix)
        .animation(.easeInOut(duration: 1.2), value: timeOfDay.rawValue)
    }
}

