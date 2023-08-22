//
//  DosesView.swift
//  Pill'd
//
//  Created by Sen Cai on 10/19/23.
//

import SwiftUI
import SwiftData

struct DosesView: View {
    @Binding var currentDate: Date
    @Query private var doses: [Dose]
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Dose> {
            return $0.dateTime >= startOfDate && $0.dateTime < endOfDate
        }
        let sortDescriptor = [
            // only available in iOS 17
            SortDescriptor(\Dose.dateTime, order: .forward)
        ]
        self._doses = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
                    ForEach(doses) { dose in
                        DoseRowView(dose: dose)
                    }
                }
                .padding(.leading, 15)
                .padding(.top, 15)
                .overlay {
                    if doses.isEmpty {
                        Text("No Doses Today")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .frame(width: 150)
                    }
                }
    }
}

