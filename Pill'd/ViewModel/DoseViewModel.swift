//
//  MedicationForm.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI
import CoreData

class DoseViewModel: ObservableObject {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Medication.name, ascending: true)]) var medications: FetchedResults<Medication>

    @Published var openNewDose: Bool = false
    @Published var doseDateTime: Date = Date()
    @Published var doseMedication: Medication?

    func addDose(context: NSManagedObjectContext) -> Bool {
        let dose = Dose(context: context)
        dose.dateTime = doseDateTime
//        dose.medication = doseMedication
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetDoseData() {
        doseDateTime = Date()
    }
}
