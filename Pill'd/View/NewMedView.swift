//
//  AddNewMed.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI

struct NewMedView: View {
    @EnvironmentObject var medModel: MedicationViewModel
    @Environment(\.self) var newMedViewContext
    var body: some View {
        VStack(spacing: 12) {
            Text("Add Medication")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        newMedViewContext.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Medication Name")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                TextField("", text: $medModel.medName)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            
            Divider()
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Dosage")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                HStack{
                    
                    TextField("Dose", text: $medModel.medDosage)
                    
                    Picker("Pick a unit", selection: $medModel.medDosageUnit) {
                        let values: [String] = ["mg", "g", "mL", "L"]
                        ForEach(values, id: \.self) { value in
                            Text(value)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                }
            }
            .frame(alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Duration")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                HStack{
                    Text("Hours:")
                    Picker("Hours", selection: $medModel.medDuration) {
                        ForEach(Array(stride(from: 0.0, through: 24.0, by: 0.5)), id: \.self) { value in
                            Text(String(format: "%.1f", value))
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct NewMedView_Previews: PreviewProvider {
    static var previews: some View {
        NewMedView()
            .environmentObject(MedicationViewModel())
    }
}
