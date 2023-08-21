//
//  NewDoseView.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/1/23.
//

import SwiftUI

struct NewDoseView: View {
    @EnvironmentObject var doseModel: DoseViewModel
    @Environment(\.managedObjectContext) var newDoseViewContext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(entity: Medication.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Medication.name, ascending: true)], animation: .easeInOut) var medications: FetchedResults<Medication>
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
                    doseModel.showDatePicker.toggle()
                } label: {
                    Image("calendar")
                        .foregroundColor(.black)
                }
            }
            
            
            Picker("Select a Medication", selection: $doseModel.doseMedication) {
                            ForEach(medications, id: \.self) { medication in
                                Text(medication.name ?? "Unknown Medication")
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
            
            Button {
                if doseModel.addDose(context: newDoseViewContext) {
                    dismiss()
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
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                if doseModel.showDatePicker {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture{
                            doseModel.showDatePicker = false
                        }
                    
                    DatePicker.init("", selection: $doseModel.doseDateTime, in: Date.distantPast...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding()
                }
            }
            .animation(.easeInOut, value: doseModel.showDatePicker)
        }
    }
}

