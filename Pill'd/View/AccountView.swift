//
//  AccountView.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/19/23.
//

import SwiftUI

struct AccountView: View {
    
//    @FetchRequest(entity: Medication.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Medication.duration, ascending: false)], animation: .easeInOut) var meds: FetchedResults<Medication>
    
    var meds: [Medication] = []
    
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

struct AccountView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.medName = "Sample1"
        med.dosageUnit = "mg"
        med.dosageValue = 500.0
        med.duration = 3.0
        
        let med2 = Medication(context: context)
        med2.medName = "Sample Medication 2"
        med2.dosageUnit = "mg"
        med2.dosageValue = 300.0
        med2.duration = 3.0
        
        let med3 = Medication(context: context)
        med3.medName = "Sample3"
        med3.dosageUnit = "g"
        med3.dosageValue = 1000.0
        med3.duration = 3.0
        
        let meds: [Medication] = [med, med2, med3]
        
        return NavigationView {
            AccountView(meds: meds)
        }
    }
}
