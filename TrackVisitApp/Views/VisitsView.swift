import SwiftUI

struct VisitsView: View {
    @ObservedObject var viewModel: VisitsViewModel

    var body: some View {
        NavigationView {
            List(viewModel.visits) { visit in
                VStack(alignment: .leading) {
                    Text("Arrival: \(visit.arrivalDate)")
                    Text("Departure: \(visit.departureDate)")
                    Text(String(format: "Lat: %.4f, Lon: %.4f", visit.coordinate.latitude, visit.coordinate.longitude))
                    Text("Duration: \(visit.duration) seconds")
                }
            }
            .navigationTitle("Visits")
        }
    }
}
