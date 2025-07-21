//
//  Track_VisitApp.swift
//  Track Visit
//
//  Created by Christos Bimpas on 18/07/2025.
//

import SwiftUI
import SwiftData
import CoreLocation

@main
struct Track_VisitApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @StateObject private var visitTracker: VisitTracker

    init() {
        _visitTracker = StateObject(wrappedValue: VisitTracker(context: sharedModelContainer.mainContext))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(visitTracker)
        }
        .modelContainer(sharedModelContainer)
    }
}
