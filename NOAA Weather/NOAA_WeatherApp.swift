//
//  NOAA_WeatherApp.swift
//  NOAA Weather

import SwiftUI
import Combine
import AVFoundation
import WidgetKit
import BackgroundTasks

extension Notification.Name {
    static let refreshAllLocations = Notification.Name("refreshAllLocations")
}

@main
struct NOAA_WeatherApp: App {
    @State private var locationStore = LocationStore()
    @State private var locationManager = LocationManager()
    @State private var selectedLocationID: String? = "current"
    @Environment(\.scenePhase) private var phase

    private let refreshTaskID = "com.wildcat.weather.refresh"
    
    init() {
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
        registerBackgroundTask()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(selectedID: $selectedLocationID)
                .environment(locationStore)
                .environment(locationManager)
                .onOpenURL { url in
                    handleDeepLink(url)
                }
                .onAppear { locationManager.requestLocation() }
                .onReceive(Timer.publish(every: 900, on: .main, in: .common).autoconnect()) { _ in
                    // Nudge GPS location (LocationPageView picks this up via .task)
                    locationManager.requestLocation()
                    // Tell all saved-location pages to refresh too
                    NotificationCenter.default.post(name: .refreshAllLocations, object: nil)
                }
        }
    }
    
    private func handleDeepLink(_ url: URL) {
    // Look for: wildcat-weather://location/{id}
    guard url.scheme == "wildcat-weather",
          url.host == "location",
          let locationID = url.pathComponents.last else { return }
    
    // Update the state to switch the UI to this location
    selectedLocationID = locationID
    }
    
    private func registerBackgroundTask() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: refreshTaskID, using: nil) { task in
            guard let refreshTask = task as? BGAppRefreshTask else { return }
            handleAppRefresh(task: refreshTask)
        }
    }

    private func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: refreshTaskID)
        // Request a refresh in 30 minutes
        request.earliestBeginDate = Date(timeIntervalSinceNow: 30 * 60)
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Scheduling failed: \(error)")
        }
    }

    private func handleAppRefresh(task: BGAppRefreshTask) {
        scheduleAppRefresh()

        let manager = locationManager
        let savedLocations = locationStore.saved

        task.expirationHandler = { }

        Task {
            if let coord = manager.coordinate {
                let vm = WeatherViewModel()
                await vm.load(coordinate: coord, locationID: "current")
            }

            for loc in savedLocations {
                let vm = WeatherViewModel()
                await vm.load(coordinate: loc.coordinate, locationID: loc.id.uuidString)
            }

            task.setTaskCompleted(success: true)
        }
    }
}
