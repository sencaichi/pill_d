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
    @Published var doseName: String = ""
    @Published var showDatePicker: Bool = false

    func addDose(context: NSManagedObjectContext) -> Bool {
        let dose = Dose(context: context)
        dose.id = UUID()
        dose.dateTime = doseDateTime
        dose.title = doseName
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetDoseData() {
        doseDateTime = Date()
    }
}
