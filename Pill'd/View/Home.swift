//
//  Home.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/31/23.
//

import SwiftUI

struct Home: View {
    @State private var currentDate: Date = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HeaderView()
        })
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
        }
    }
}
