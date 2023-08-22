import SwiftUI

struct TabBar: View {
    @Binding var expand: Bool
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 0) {
                    Button(action: {
                        if self.expand {
                            self.expand = false
                        }
                        self.selectedTab = "home"
                    }) {
                        Image("home")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(self.selectedTab == "home" ? Color.PinkAccent : Color.PinkPilld)
                    .offset(y: 20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
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
                        if self.expand {
                            self.expand = false
                        }
                        self.selectedTab = "heart"
                    }) {
                        Image("heart")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(self.selectedTab == "heart" ? Color.PinkAccent : Color.PinkPilld)
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

