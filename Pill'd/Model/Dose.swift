//
//  Dose.swift
//  Pill'd
//
//  Created by Sen Cai on 10/15/23.
//
//

import SwiftUI
import SwiftData
import Foundation


@Model
public class Dose: Identifiable {
    @Attribute(.unique) public var id: UUID
    public var dateTime: Date
//    var medDuration: Double
//    var medName: String {
//        let name = medication.medName
//        return name
//    }
//    @Relationship(deleteRule: .cascade, inverse: \Medication.doses) var medication: Medication
    @Relationship var medication: Medication?

    init(id: UUID = .init(), dateTime: Date = .init(), medication: Medication?) {
        self.dateTime = dateTime
        self.id = id
        self.medication = medication
//        self.medDuration = medDuration
        }

}

/*
 medication name, duration, and dose dateTime
 query medications in newdoseview
 picker selects by medication name, pulls medName and duration data
 */
