import SwiftUI

struct AccountView: View {
    
    @FetchRequest(entity: Medication.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Medication.duration, ascending: false)], animation: .easeInOut) var meds: FetchedResults<Medication>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Your Medications")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
            MedsView()
        }
        .vSpacing(.top)
    }
    
    @ViewBuilder
    func MedsView() -> some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0) {
                ForEach(meds) { med in
                    MedRowView(med: med)
                }
            }
            .padding(.leading, 10)
            .padding(.top, 15)
        }
    }
    
    @ViewBuilder
    func MedRowView(med: Medication) -> some View {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(med.medName ?? "")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    HStack {
                        Text(String(format: "%.1f", med.dosageValue))
                        Text(med.dosageUnit ?? "")
                    }
                    Label {
                        Text("\(String(med.duration)) hours")
                    } icon: {
                        Image(systemName: "clock")
                    }
                })
                .padding(15)
                .padding(.leading, 20)
                .hSpacing(.leading)
                .offset(x: 20, y: -5)
            }
            .background{RoundedRectangle(cornerRadius: 35).fill(Color.PinkPilld).padding([.bottom, .trailing], 10)}
        }
}
