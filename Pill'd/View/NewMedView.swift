import SwiftUI

struct NewMedView: View {
    
    @StateObject var medModel: MedicationViewModel = .init()
    @Environment(\.managedObjectContext) var newMedViewContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add Medication")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        self.dismiss()
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
                
                HStack {
                        Picker("Dose", selection: $medModel.medDosage) {
                            ForEach(Array(stride(from: 0.0, through: 24.0, by: 0.5)), id: \.self) { value in
                                Text(String(format: "%.1f", value))
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    
                    
                    Picker("Pick a unit", selection: $medModel.medDosageUnit) {
                        let values: [String] = ["mg", "g", "mL", "L"]
                        ForEach(values, id: \.self) { value in
                            Text(value)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            
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
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
            
            Button {
                if medModel.addMed(context: newMedViewContext) {
                    self.dismiss()
                }
            } label: {
                Text("Save Medication")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.bottom, 10)
            .disabled(medModel.medName == "")
            .opacity(medModel.medName == "" ? 0.6 : 1)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}
