//
//  Dose.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI

struct Dose: Identifiable {
    var id: UUID = .init()
    var dateTime: Date = .init()
    var medication: Medication
}

var sampleDoses: [Dose] = [
    .init(dateTime: .updateHour(-5), medication: magnesium),
    .init(dateTime: .updateHour(-3), medication: caffeine),
    .init(dateTime: .updateHour(-4), medication: taurine),
    .init(dateTime: .updateHour(0), medication: magnesium),
    .init(dateTime: .updateHour(2), medication: caffeine),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
