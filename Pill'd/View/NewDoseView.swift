import SwiftUI

struct NewDoseView: View {
    
    @State var doseModel: DoseViewModel
    @Environment(\.managedObjectContext) var newDoseViewContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(entity: Medication.entity(), sortDescriptors: []) var medications: FetchedResults<Medication>
    
    var body: some View {
        VStack(spacing: 15) {
            Text("New Dose")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button {
                        
                        self.dismiss()
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Dose Time")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text(doseModel.doseDateTime.format("MMMM d, yyyy, h:mm a"))
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
            
            Divider()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Pick a Medication:")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Picker("Pick a Medication", selection: $doseModel.doseMed) {
                    ForEach(Array(medications), id: \.self) { (medication: Medication) in
                        Text(medication.medName ?? "")
                            .tag(medication.id)
                    }
                }
                .pickerStyle(InlinePickerStyle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
            
            Button {
                if doseModel.addDose(context: newDoseViewContext) {
                    self.dismiss()
                }
            } label: {
                Text("Save Dose")
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
                    
                    DatePicker.init("Date", selection: $doseModel.doseDateTime, in: Date.distantPast...Date.distantFuture)
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
