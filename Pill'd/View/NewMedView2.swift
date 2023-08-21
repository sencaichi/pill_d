//
//  NewMedView2.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/20/23.
//

import SwiftUI

struct NewMedView2: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var duration: Double = 0.0
    @State private var dosage: Double = 0
    @State private var dosageUnit = ""
    
    var body: some View {
        Form {
            Section(header: Text("Add Medication")) {
                TextField("Medication Name", text: $name)
                
                VStack {
                    Text("Duration: \(duration, specifier: "%.1f") hours")
                    Slider(value: $duration, in: 0.0...24.0, step: 0.5)
                }
                
                VStack {
                    Text("Dosage")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    HStack{
                        
                        TextField("Enter an integer", value: $dosage, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .keyboardType(.numberPad) // Display numeric keypad
                                        .padding()
                        Picker("Pick a unit", selection: $dosageUnit) {
                            let values: [String] = ["mg", "g", "mL", "L"]
                            ForEach(values, id: \.self) { value in
                                Text(value)
                            }
                        }
                    }
                }

                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addMed(name: name, duration: duration, dosage: dosage, dosageUnit: dosageUnit, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct NewMedView2_Previews: PreviewProvider {
    static var previews: some View {
        NewMedView2()
    }
}
