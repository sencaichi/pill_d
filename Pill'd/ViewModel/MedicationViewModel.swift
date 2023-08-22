//import SwiftUI
//import CoreData
//
//class MedicationViewModel: ObservableObject {
//    @Published var openEditMed: Bool = false
//    @Published var medName: String = ""
//    @Published var medDuration: Double = 0.0
//    @Published var medDosage: Double = 0.0
//    @Published var medDosageUnit: String = "mg"
//    
//    func addMed(context: NSManagedObjectContext) -> Bool {
//        let med = Medication(context: context)
//        med.medName = medName
//        med.dosageValue = medDosage
//        med.dosageUnit = medDosageUnit
//        med.duration = medDuration
//        
//        if let _ = try? context.save() {
//            return true
//        }
//        return false
//    }
//    
//    func resetMedData() {
//        medName = ""
//        medDosage = 0.0
//        medDosageUnit = "mg"
//        medDuration = 0.0
//    }
//}
