//
//  DataController.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/20/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Pill_d")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("Data was not saved...")
        }
    }
    
    func addMed(name: String, duration: Double, dosage: Double, dosageUnit: String, context: NSManagedObjectContext) {
        let med = Medication(context: context)
        med.name = name
        med.duration = duration
        med.dosageValue = dosage
        med.dosageUnit = dosageUnit
        
        save(context: context)
    }
    
    func editMed(med: Medication, name: String, duration: Double, dosage: Double, dosageUnit: String, context: NSManagedObjectContext) {
        med.name = name
        med.duration = duration
        med.dosageValue = dosage
        med.dosageUnit = dosageUnit
        
        save(context: context)
    }
    
}
