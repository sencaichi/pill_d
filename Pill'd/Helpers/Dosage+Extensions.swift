//
//  Medication+Extensions.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI

extension Dosage {
    var unitType: DosageUnit? {
        get {
            guard let unit = self.unit else {
                return nil
            }
            return DosageUnit(rawValue: unit)
        }
        
        set {
            self.unit = newValue?.rawValue
        }
    }
}

enum DosageUnit: String {
    case milligram = "mg"
    case gram = "g"
    case milliliter = "mL"
    case liter = "L"
}
