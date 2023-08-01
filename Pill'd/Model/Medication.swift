//
//  Medication.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI

struct Medication {
    var id: UUID = .init()
    var name: String
    var duration: Double
    var dosage: Dosage
}

struct Dosage {
    var value: Double
    var unit: DosageUnit
}

enum DosageUnit: String {
    case milligram = "mg"
    case gram = "g"
    case milliliter = "mL"
    case liter = "L"
}

let magnesium = Medication(name: "Magnesium", duration: 10, dosage: Dosage(value: 1000, unit: .milligram))
let caffeine = Medication(name: "Caffeine", duration: 5, dosage: Dosage(value: 100, unit: .milligram))
let taurine = Medication(name: "Taurine", duration: 2, dosage: Dosage(value: 500, unit: .milligram))


