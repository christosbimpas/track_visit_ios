# Track Visit iOS App

This project demonstrates a minimal SwiftUI application that uses the MVVM + Coordinator architecture pattern to track user visits using Core Location.

## Features
- Uses `CLLocationManager` visit monitoring (`locationManager(_:didVisit:)`).
- Displays a list of visits with entry/exit times, coordinates, and duration.

## Structure
- `TrackVisitAppApp.swift` – App entry point.
- `Coordinators/AppCoordinator.swift` – Handles starting the main view.
- `ViewModels/VisitsViewModel.swift` – Manages visit data and interacts with `CLLocationManager`.
- `Views/VisitsView.swift` – SwiftUI view that shows logged visits.

## Running the App
Open the `TrackVisitApp` folder in Xcode and run on a real device to collect visit data.
Make sure to grant Always Location permission when prompted.

