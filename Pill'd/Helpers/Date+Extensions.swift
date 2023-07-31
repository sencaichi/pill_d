//
//  Date+Extensions.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
