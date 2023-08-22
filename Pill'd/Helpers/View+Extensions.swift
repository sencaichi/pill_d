import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    // checking if two dates are the same
    func isSameDate(_ date: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date, inSameDayAs: date2)
    }
}

extension Color {
    static let BG = Color("BG")
    static let PinkPilld = Color("PinkPilld")
    static let PinkAccent = Color("PinkAccent")
}
