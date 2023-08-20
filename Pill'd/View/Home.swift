//
//  Home.swift
//  Pill'd
//
//  Created by Sen Ayané on 7/31/23.
//

import SwiftUI

struct Home: View {
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = false
    @State private var createNewDose: Bool = false
    @Namespace private var animation
    @StateObject var doseModel: DoseViewModel = .init()
    @StateObject var medModel: MedicationViewModel = .init()
    
    @FetchRequest(entity: Dose.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Dose.dateTime, ascending: false)], predicate: nil, animation: .easeInOut) var doses: FetchedResults<Dose>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HeaderView()
            
            ScrollView(.vertical) {
                VStack {
//                    DosesView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
            
        })
        .vSpacing(.top)
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        })
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(Color.PinkAccent)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .foregroundStyle(.gray)
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .padding(15)
        .background(.white)
        .onChange(of: currentWeekIndex) { newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                createWeek = true
            }
        }
    }
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(Color.PinkPilld)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            if day.date.isToday {
                                Circle()
                                    .fill(Color.PinkAccent)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        })
                }
                .hSpacing(.center)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 15 && createWeek {
                            paginateWeek()
                            createWeek = false
                        }
                     }
            }
        }
    }
    
    @ViewBuilder
    func DosesView() -> some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(doses) { dose in
                DoseRowView(dose: dose)
            }
        }
        .padding(.leading, 15)
        .padding(.top, 15)
    }
    
    @ViewBuilder
    func DoseRowView(dose: Dose) -> some View {
            HStack(alignment: .top, spacing: 15) {
                Circle()
                    .fill(Color.PinkAccent)
                    .frame(width: 10, height: 10)
                    .padding(4)
                    .overlay {
                        Circle()
                            .frame(width: 50, height: 50)
                            .blendMode(.destinationOver)
                    }
                
                VStack(alignment: .leading, spacing: 8, content: {
//                    Text(dose.medication.name)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.black)
                    Label {
                        Text((dose.dateTime ?? Date()).formatted(date: .omitted, time: .standard))
                    } icon: {
                        Image(systemName: "clock")
                    }
                })
                .padding(15)
                .hSpacing(.leading)
                .offset(x: 20, y: -1)
                .background(RoundedRectangle(cornerRadius: 35).fill(Color.PinkPilld).padding(.trailing, 10))
            }
        }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
}
