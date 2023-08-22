import SwiftUI

struct NewMedView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Binding var expand: Bool
    
    @State var medName: String
    @State var dosageUnit: String
    @State var dosageValue: Double
    @State var duration: Double
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add Medication")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        dismiss()
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
                
                TextField("Enter name", text: $medName)
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
                    Picker("Dose", selection: $dosageValue) {
                            ForEach(Array(stride(from: 0.0, through: 24.0, by: 0.5)), id: \.self) { value in
                                Text(String(format: "%.1f", value))
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    
                    
                    Picker("Pick a unit", selection: $dosageUnit) {
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
                    Picker("Hours", selection: $duration) {
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
            
            Button(action: {
                let med = Medication(dosageUnit: dosageUnit, dosageValue: dosageValue, duration: duration, medName: medName, doses: [])
                do {
                    context.insert(med)
                    try context.save()
                    self.expand = false
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
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
            })
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.bottom, 10)
            .disabled(medName == "")
            .opacity(medName == "" ? 0.6 : 1)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}
