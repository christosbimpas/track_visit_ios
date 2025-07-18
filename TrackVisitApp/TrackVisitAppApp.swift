import SwiftUI

@main
struct TrackVisitAppApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.rootView()
        }
    }
}
