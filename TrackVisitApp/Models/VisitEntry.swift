import Foundation
import CoreLocation

struct VisitEntry: Identifiable {
    let id = UUID()
    let arrivalDate: Date
    let departureDate: Date
    let coordinate: CLLocationCoordinate2D

    var duration: TimeInterval {
        departureDate.timeIntervalSince(arrivalDate)
    }
}
