//
//  AccountView.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI

struct AccountView: View {
    
    @Environment(\.self) var newAccountViewContext
    @FetchRequest(entity: Medication.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Medication.duration, ascending: false)], predicate: nil, animation: .easeInOut) var meds: FetchedResults<Medication>
    
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
        VStack(alignment: .leading, spacing: 0) {
            ForEach(meds) { med in
                MedRowView(med: med)
            }
        }
        .padding(.leading, 15)
        .padding(.top, 15)
    }
    
    @ViewBuilder
    func MedRowView(med: Medication) -> some View {
            HStack(alignment: .top, spacing: 15) {
                Circle()
                    .fill(Color.PinkAccent)
                    .frame(width: 10, height: 10)
                    .overlay {
                        Circle()
                            .frame(width: 50, height: 50)
                            .blendMode(.destinationOver)
                    }
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text(med.name ?? "")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    HStack {
                        Text("\(med.dosageValue)")
                        Text(med.dosageUnit ?? "")
                    }
                    Label {
                        Text("\(String(med.duration)) hours")
                    } icon: {
                        Image(systemName: "clock")
                    }
                })
                .padding(15)
                .hSpacing(.leading)
                .offset(x: 20, y: -1)
                .background{RoundedRectangle(cornerRadius: 35).fill(Color.PinkPilld).padding(.trailing, 10)}
            }
        }
}

//struct AccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountView()
//    }
//}
