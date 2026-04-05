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
 * Returns the gradient color stops for a condition + time-of-day pair.
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
            // Vivid alpine blue to a warm, sun-kissed yellow horizon
            return [
                Color(red: 0.12, green: 0.45, blue: 0.88),
                Color(red: 0.35, green: 0.68, blue: 0.96),
                Color(red: 1.00, green: 0.95, blue: 0.82),
            ]
        case .mostlyClear:
            // Bright sky blue with a softer, paler horizon
            return [
                Color(red: 0.20, green: 0.55, blue: 0.90),
                Color(red: 0.50, green: 0.78, blue: 0.98),
                Color(red: 0.92, green: 0.96, blue: 1.00),
            ]
        case .overcast, .fog:
            // Heavy, low-ceiling charcoal and slate. Moody and flat.
            return [
                Color(red: 0.22, green: 0.25, blue: 0.30),
                Color(red: 0.35, green: 0.38, blue: 0.45),
                Color(red: 0.48, green: 0.52, blue: 0.58),
            ]
        case .rain:
            // Deep, wet navy and cool slate.
            return [
                Color(red: 0.10, green: 0.15, blue: 0.25),
                Color(red: 0.22, green: 0.28, blue: 0.38),
                Color(red: 0.35, green: 0.42, blue: 0.50),
            ]
        case .snow:
            // Bright white-out. Pure whites and cold silver.
            return [
                Color(red: 0.85, green: 0.88, blue: 0.92),
                Color(red: 0.95, green: 0.96, blue: 0.98),
                Color(red: 1.00, green: 1.00, blue: 1.00),
            ]
        case .thunderstorm:
            // Ominous "bruised" teal and near-black charcoal.
            return [
                Color(red: 0.04, green: 0.05, blue: 0.10),
                Color(red: 0.15, green: 0.20, blue: 0.25),
                Color(red: 0.28, green: 0.35, blue: 0.32),
            ]
        case .wind:
            return weatherGradientColors(condition: .mostlyClear, timeOfDay: .day)
        }

    // -------------------------------------------------------------------------
    // NIGHT
    // -------------------------------------------------------------------------
    case .night:
        switch condition {
        case .clear:
            // Infinite deep navy to a dark indigo horizon
            return [
                Color(red: 0.01, green: 0.02, blue: 0.08),
                Color(red: 0.03, green: 0.06, blue: 0.18),
                Color(red: 0.08, green: 0.12, blue: 0.30),
            ]
        case .mostlyClear:
            return [
                Color(red: 0.02, green: 0.04, blue: 0.12),
                Color(red: 0.08, green: 0.12, blue: 0.25),
                Color(red: 0.15, green: 0.20, blue: 0.38),
            ]
        case .overcast, .fog:
            // Dark, claustrophobic grey-black
            return [
                Color(red: 0.03, green: 0.04, blue: 0.06),
                Color(red: 0.08, green: 0.10, blue: 0.12),
                Color(red: 0.15, green: 0.18, blue: 0.22),
            ]
        case .rain:
            return [
                Color(red: 0.02, green: 0.04, blue: 0.08),
                Color(red: 0.06, green: 0.10, blue: 0.18),
                Color(red: 0.12, green: 0.18, blue: 0.28),
            ]
        case .snow:
            // Snow reflecting dim light — pale lavender-grey and silver
            return [
                Color(red: 0.12, green: 0.14, blue: 0.20),
                Color(red: 0.25, green: 0.28, blue: 0.35),
                Color(red: 0.45, green: 0.48, blue: 0.55),
            ]
        case .thunderstorm:
            return [
                Color(red: 0.01, green: 0.01, blue: 0.05),
                Color(red: 0.05, green: 0.04, blue: 0.12),
                Color(red: 0.12, green: 0.10, blue: 0.22),
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
            // High-contrast electric orange and deep sky blue
            return [
                Color(red: 0.15, green: 0.40, blue: 0.75),
                Color(red: 0.95, green: 0.50, blue: 0.30),
                Color(red: 1.00, green: 0.85, blue: 0.40),
            ]
        case .mostlyClear:
            return [
                Color(red: 0.20, green: 0.45, blue: 0.70),
                Color(red: 0.85, green: 0.45, blue: 0.45),
                Color(red: 1.00, green: 0.80, blue: 0.65),
            ]
        case .overcast, .fog:
            // Muted, dusty purple/mauve. The sun trying and failing to break through.
            return [
                Color(red: 0.25, green: 0.22, blue: 0.28),
                Color(red: 0.45, green: 0.38, blue: 0.42),
                Color(red: 0.60, green: 0.55, blue: 0.58),
            ]
        case .rain:
            return [
                Color(red: 0.12, green: 0.18, blue: 0.28),
                Color(red: 0.25, green: 0.30, blue: 0.42),
                Color(red: 0.40, green: 0.45, blue: 0.55),
            ]
        case .snow:
            // "Alpenglow" — soft pink light hitting pure white snow
            return [
                Color(red: 0.82, green: 0.85, blue: 0.92),
                Color(red: 1.00, green: 0.92, blue: 0.95),
                Color(red: 1.00, green: 1.00, blue: 1.00),
            ]
        case .thunderstorm:
            // Bruised, burnt orange and deep violet
            return [
                Color(red: 0.10, green: 0.05, blue: 0.15),
                Color(red: 0.35, green: 0.15, blue: 0.25),
                Color(red: 0.65, green: 0.35, blue: 0.20),
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

