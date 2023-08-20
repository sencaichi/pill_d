//
//  AddNewMed.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI

struct NewMedView: View {
    @EnvironmentObject var medModel: MedicationViewModel
    var body: some View {
        VStack{
            Text("Add Medication")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Medication Name")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $medModel.medName)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Duration")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

