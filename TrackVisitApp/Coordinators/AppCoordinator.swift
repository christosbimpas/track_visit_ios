import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var visitsViewModel = VisitsViewModel()

    func rootView() -> some View {
        VisitsView(viewModel: visitsViewModel)
    }
}
