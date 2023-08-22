//
//  Medication+CoreDataProperties.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/22/23.
//
//

import Foundation
import CoreData


extension Medication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medication> {
        return NSFetchRequest<Medication>(entityName: "Medication")
    }

    @NSManaged public var dosageUnit: String?
    @NSManaged public var dosageValue: Double
    @NSManaged public var duration: Double
    @NSManaged public var medName: String?
    @NSManaged public var doses: NSSet?

}

// MARK: Generated accessors for doses
extension Medication {

    @objc(addDosesObject:)
    @NSManaged public func addToDoses(_ value: Dose)

    @objc(removeDosesObject:)
    @NSManaged public func removeFromDoses(_ value: Dose)

    @objc(addDoses:)
    @NSManaged public func addToDoses(_ values: NSSet)

    @objc(removeDoses:)
    @NSManaged public func removeFromDoses(_ values: NSSet)

}

extension Medication : Identifiable {

}
