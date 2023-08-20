//
//  ContentView.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var doseModel: DoseViewModel = .init()
    @StateObject var medModel: MedicationViewModel = .init()
    @State var index = 1
    
    var body: some View {
        VStack{
            ZStack{
                Home()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .preferredColorScheme(.light)
            }
            .padding(.bottom, -35)
            
            TabBar(index: self.$index, openEditMed: self.$medModel.openEditMed)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
        .fullScreenCover(isPresented: $medModel.openEditMed) {
            NewMedView()
                .environmentObject(medModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
