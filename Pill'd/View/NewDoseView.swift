//
//  NewDoseView.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/1/23.
//

import SwiftUI

struct NewDoseView: View {
    @EnvironmentObject var doseModel: DoseViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack{
            Text("New Dose")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Dose Time")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(doseModel.doseDateTime.formatted(date: .abbreviated, time: .omitted) + ", " + doseModel.doseDateTime.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                }
            }
            
            Button {
                if doseModel.addDose(context: env.managedObjectContext) {
                    env.dismiss()
                }
            } label: {
                Text("Add Dose")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

