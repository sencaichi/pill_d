import SwiftUI
import SwiftData

@available(iOS 17.0, *)
struct DoseRowView: View {
    
    @Bindable var dose: Dose
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
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
                Text(dose.medication?.medName ?? "")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Label {
                    Text(dose.dateTime.format("h:mm a"))
                } icon: {
                    Image(systemName: "clock")
                }
            }
            .padding(15)
            .hSpacing(.leading)
            .offset(x: 20, y: -1)
            .background(RoundedRectangle(cornerRadius: 35).fill(Color.PinkPilld).padding(.trailing, 10))
        })
        .contextMenu {
            Button("Delete Dose", role: .destructive) {
                    context.delete(dose)
                    try? context.save()
                }
            }
        }
}
