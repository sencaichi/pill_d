//
//  TabBar.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/2/23.
//

import SwiftUI

struct TabBar: View {
    @Binding var index : Int
    var body: some View {
                HStack{
                    Button(action: {
                        self.index = 1
                    }) {
                        Image("home")
                            .imageScale(.large)
                            .padding()
                    }
                    .foregroundColor(self.index == 1 ? Color.PinkAccent : Color.PinkPilld)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 2
                    }) {
                        Image("add").imageScale(.large)
                    }
                    .foregroundColor(Color.PinkAccent)
                    .offset(y: -25)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 3
                    }) {
                        Image("heart")
                            .imageScale(.large)
                            .padding()
                    }.foregroundColor(self.index == 3 ? Color.PinkAccent : Color.PinkPilld)
                }
                .padding(.horizontal, 35)
                .padding(.top, 35)
                .background(Color.white)
                .clipShape(CShape())
    }
}

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: (rect.width / 2) + 4, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}

