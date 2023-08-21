//
//  ContentView.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/8/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var doseModel: DoseViewModel = .init()
    @StateObject var medModel: MedicationViewModel = .init()
    @State var index = 1
    @State var expand = false
    @State var selectedTab = "home"
    
    var body: some View {
        VStack{
            ZStack{
                Home()
                    .opacity(selectedTab == "home" ? 1 : 0)
                AccountView()
                    .opacity(selectedTab == "heart" ? 1 : 0)
            }
            
            ZStack(alignment: .bottom){
                
                ZStack(alignment:. top){
                    Circle()
                        .trim(from: 0.5, to: self.expand ? 1 : 0.5)
                        .fill(Color.PinkAccent)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    
                    ZStack {
                        
                        Button(action: {
                            
                        }) {
                            VStack(spacing: 5) {
                                
                                Image("dose")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Text("Add Dose")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        .offset(x: -100, y: 50)
                        
                        
                        Button(action: {
                            medModel.openEditMed.toggle()
                        }) {
                            VStack(spacing: 5) {
                                
                                Image("pill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Text("Medication")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        .offset(x: 100, y: 50)
                    }
                    .opacity(self.expand ? 1 : 0)
                }
                .offset(y: UIScreen.main.bounds.width / 1.6)
            }
            .clipped()
            .offset(y: UIScreen.main.bounds.width / 10)
            
            TabBar(index: self.$index, expand: self.$expand, selectedTab: self.$selectedTab)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.light)
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $medModel.openEditMed) {
            medModel.resetMedData()
        } content: {
            NewMedView()
                .environmentObject(medModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MedicationViewModel())
    }
}
