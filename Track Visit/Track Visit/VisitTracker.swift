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
        self.locationManager.startMonitoringVisits()
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let newItem = Item(timestamp: visit.arrivalDate)
        modelContext.insert(newItem)
    }
}
