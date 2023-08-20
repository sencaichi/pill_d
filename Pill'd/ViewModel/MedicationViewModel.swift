//
//  MedicationViewModel.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI
import CoreData

class MedicationViewModel: ObservableObject {
    @Published var openEditMed: Bool = false
    @Published var medName: String = ""
    @Published var medDuration: Double = 0
    @Published var medDosage: Double = 0
    @Published var medDosageUnit: String = "mg"
    
    func addMed(context: NSManagedObjectContext) -> Bool {
        let med = Medication(context: context)
        med.name = medName
        med.duration = medDuration
        med.dosageValue = medDosage
        med.dosageUnit = medDosageUnit
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetMedData() {
        medName = ""
        medDuration = 0
        medDosage = 0
        medDosageUnit = "mg"
    }
}