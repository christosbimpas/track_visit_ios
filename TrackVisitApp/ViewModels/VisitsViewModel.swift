import Foundation
import Combine
import CoreLocation

final class VisitsViewModel: NSObject, ObservableObject {
    @Published var visits: [VisitEntry] = []
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
    }
}

extension VisitsViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let entry = VisitEntry(
            arrivalDate: visit.arrivalDate,
            departureDate: visit.departureDate,
            coordinate: visit.coordinate
        )
        DispatchQueue.main.async {
            self.visits.append(entry)
        }
    }
}
