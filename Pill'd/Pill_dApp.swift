import SwiftUI

@main
struct Pill_dApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // only available in iOS 17
        .modelContainer(for: [Medication.self, Dose.self])
    }
}


