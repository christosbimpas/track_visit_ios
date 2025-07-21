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
    let sharedModelContainer: ModelContainer

    @StateObject private var visitTracker: VisitTracker

    init() {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.sharedModelContainer = container
            _visitTracker = StateObject(wrappedValue: VisitTracker(context: container.mainContext))
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(visitTracker)
        }
        .modelContainer(sharedModelContainer)
    }
}
