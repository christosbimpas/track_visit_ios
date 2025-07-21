import Foundation
import CoreLocation
import SwiftData

final class VisitTracker: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    private var modelContext: ModelContext

    init(context: ModelContext) {
        self.modelContext = context
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        // Enable location updates while the app is in the background so that
        // visit events are delivered even when the UI is not active.
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.startMonitoringVisits()
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let newItem = Item(timestamp: visit.arrivalDate)
        modelContext.insert(newItem)
    }
}
