import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var openNewDose: Bool = false
    @State var openEditMed: Bool = false
    @State var expand: Bool = false
    @State var selectedTab = "home"
    @State var doseDate: Date = .init()
    @State var showDatePicker: Bool = false
    
    @Query private var medications: [Medication]
    
    var body: some View {
        VStack(spacing: 0){
            ZStack(alignment: .bottom) {
                GeometryReader{_ in
                    VStack{
                        ZStack{
                            Home()
                                .opacity(selectedTab == "home" ? 1 : 0)
                            AccountView()
                                .opacity(selectedTab == "heart" ? 1 : 0)
                        }
                    }
                }
                ZStack(alignment:. top){
                    Circle()
                        .trim(from: 0.5, to: self.expand ? 1 : 0.5)
                        .fill(Color.PinkAccent)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .clipped()
                        .offset(y: UIScreen.main.bounds.width / 15)
                    
                    ZStack {
                        Button(action: {
                            openNewDose.toggle()
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
                        .offset(x: -100, y: 90)
                        
                        
                        Button(action: {
                            openEditMed.toggle()
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
                        .offset(x: 100, y: 90)
                    }
                    .opacity(self.expand ? 1 : 0)
                }
                .offset(y: UIScreen.main.bounds.width / 1.8)
            }
            
            TabBar(expand: self.$expand, selectedTab: self.$selectedTab)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.light)
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $openEditMed) {

        } content: {
            NewMedView(expand: self.$expand, medName: "", dosageUnit: "mg", dosageValue: 0.0, duration: 0.0)
        }
        .fullScreenCover(isPresented: $openNewDose) {
            
        } content: {
            NewDoseView(medication: medications.first!, expand: self.$expand)
        }
    }
}

#Preview {
    ContentView()
}
