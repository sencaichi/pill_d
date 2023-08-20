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
    @Published var medDuration: Double = 0.0
    
    func addMed(context: NSManagedObjectContext) -> Bool {
        let med = Medication(context: context)
        med.name = medName
        med.duration = medDuration
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
}
