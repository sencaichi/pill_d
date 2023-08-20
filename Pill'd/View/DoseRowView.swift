//
//  DoseRowView.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/1/23.
//

import SwiftUI

struct DoseRowView: View {
    @Binding var dose: Dose
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(Color.PinkAccent)
                .frame(width: 10, height: 10)
                .padding(4)
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                }
            
//            VStack(alignment: .leading, spacing: 8, content: {
//                Text(dose.medication.name)
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.black)
//
//                Label(dose.dateTime.format("hh:mm a"), systemImage: "clock")
//                    .font(.caption)
//                    .foregroundStyle(.black)
//            })
            .padding(15)
            .hSpacing(.leading)
            .offset(x: 20, y: -1)
            .background(RoundedRectangle(cornerRadius: 35).fill(Color.PinkPilld).padding(.trailing, 10))
        }
    }
}

