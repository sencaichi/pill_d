import SwiftUI
import SwiftData
import Foundation

@Model
public class Medication: Identifiable {
    @Attribute(.unique) public var medName: String
    var dosageUnit: String
    var dosageValue: Double
    var duration: Double
    @Relationship(inverse: \Dose.medication) var doses: [Dose]?
//    var doses: [Dose?]
    

    init(dosageUnit: String = "mg", dosageValue: Double = 0.0, duration: Double = 0.0, medName: String = "", doses: [Dose]? = []) {
        self.dosageUnit = dosageUnit
        self.dosageValue = dosageValue
        self.duration = duration
        self.medName = medName
        self.doses = doses
    }
    
}
