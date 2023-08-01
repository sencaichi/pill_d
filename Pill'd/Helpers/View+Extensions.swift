//
//  View+Extensions.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    // checking if two dates are the same
    func isSameDate(_ date: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date, inSameDayAs: date2)
    }
}