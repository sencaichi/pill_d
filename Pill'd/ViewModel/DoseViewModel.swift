import SwiftUI
import CoreData

class DoseViewModel: ObservableObject {

    @Published var openNewDose: Bool = false
    @Published var doseDateTime: Date = Date()
    @Published var doseMed: Medication?
    @Published var showDatePicker: Bool = false

    func addDose(context: NSManagedObjectContext) -> Bool {
        let dose = Dose(context: context)
        dose.id = UUID()
        dose.dateTime = doseDateTime
        dose.title = doseMed?.medName
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetDoseData() {
        doseDateTime = Date()
    }
}
