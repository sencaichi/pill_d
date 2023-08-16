//
//  ContentView.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Home()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .preferredColorScheme(.light)
            }
            .padding(.bottom, -35)
            
            TabBar(index: self.$index)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
