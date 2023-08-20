//
//  TabBar.swift
//  Pill'd
//
//  Created by Sen Ayané on 8/2/23.
//

import SwiftUI

struct TabBar: View {
    @Binding var index: Int
    @Binding var expand: Bool
    
    var body: some View {
        HStack(spacing: 0) {
                    Button(action: {
                        if self.index == 2 {
                            withAnimation(Animation.default.speed(0.6)) {
                                self.expand.toggle()
                            }
                        }
                        self.index = 1
                    }) {
                        Image("home")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(self.index == 1 ? Color.PinkAccent : Color.PinkPilld)
                    .offset(y: 20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 2
                        withAnimation(Animation.default.speed(0.6)) {
                                self.expand.toggle()
                        }
                    }) {
                        Image("add")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    .foregroundColor(Color.PinkAccent)
                    .offset(x: 1, y: -20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        if self.index == 2 {
                            withAnimation(Animation.default.speed(0.6)) {
                                self.expand.toggle()
                            }
                        }
                        self.index = 3
                    }) {
                        Image("heart")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(self.index == 3 ? Color.PinkAccent : Color.PinkPilld)
                    .offset(y: 20)
                }

                .padding(.horizontal, 35)
                .padding(.top, 10)
                .background(Color.white)
                .padding(.bottom, 20)
                .clipShape(CShape())
                .padding(.top, -10)
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

