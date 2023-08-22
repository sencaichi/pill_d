//
//  Dose+CoreDataProperties.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/22/23.
//
//

import Foundation
import CoreData


extension Dose {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dose> {
        return NSFetchRequest<Dose>(entityName: "Dose")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var medication: Medication?

}
