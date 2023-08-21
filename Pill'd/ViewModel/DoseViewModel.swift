//
//  MedicationForm.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI
import CoreData

class DoseViewModel: ObservableObject {

    @Published var openNewDose: Bool = false
    @Published var doseDateTime: Date = Date()
    @Published var doseMedication: FetchedResults<Medication>.Element = Medication(entity: Medication.entity(), insertInto: context)
    @Published var showDatePicker: Bool = false

    func addDose(context: NSManagedObjectContext) -> Bool {
        let dose = Dose(context: context)
        dose.id = UUID()
        dose.dateTime = doseDateTime
        dose.medication = doseMedication
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetDoseData() {
        doseDateTime = Date()
    }
}
