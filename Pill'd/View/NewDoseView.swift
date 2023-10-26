import SwiftUI
import SwiftData

struct NewDoseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State var dateTime: Date = .init()
    @State var showDatePicker: Bool = false
    @State var medication: Medication
    
    @Query private var medications: [Medication]
    
    @Binding var expand: Bool
        
    var body: some View {
        VStack(spacing: 15) {
            Text("New Dose")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button(action: {
                        self.expand = false
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .foregroundColor(.black)
                    })
                }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Dose Time")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text(dateTime.format("MMMM d, yyyy, h:mm a"))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showDatePicker.toggle()
                } label: {
                    Image("calendar")
                        .foregroundColor(.black)
                }
            }
            
            Divider()
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 12) {
                if medications.isEmpty {
                    Text("Add Medication before Adding a New Dose")
                        .font(.title3)
                        .foregroundColor(.gray)
                } else {
                    Text("Pick a Medication")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Picker("Select a medication", selection: $medication) {
                        ForEach(medications, id: \.self) { med in
                            Text(med.medName)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
            
            Button(action: {
                let dose = Dose(dateTime: dateTime, medication: medication)
                do {
                    context.insert(dose)
                    try context.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
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
            })
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                if showDatePicker {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture{
                            showDatePicker = false
                        }
                    
                    DatePicker.init("Date", selection: $dateTime, in: Date.distantPast...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding()
                }
            }
            .animation(.easeInOut, value: showDatePicker)
        }
    }
}
