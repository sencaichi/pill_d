//
//  OffsetKey.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/31/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
