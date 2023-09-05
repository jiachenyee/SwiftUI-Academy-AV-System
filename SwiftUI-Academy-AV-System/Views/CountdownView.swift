//
//  CountdownView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct CountdownView: View {
    
    private let submissionDate = Date(timeIntervalSince1970: 1694145600)
    
    @State private var milliseconds: Int = 0
    @State private var seconds: Int = 0
    @State private var minutes: Int = 0
    @State private var hours: Int = 0
    @State private var days: Int = 0
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            VStack {
                Spacer()
                Text("Time until presentation")
                    .foregroundStyle(Color("SwiftUIAcademy"))
                    .font(.system(size: widthUnit * 80, weight: .bold, design: .default))
                HStack {
                    Spacer()
                    VStack {
                        Text("\(days)")
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.center)
                        Text("days")
                            .font(.system(size: widthUnit * 32))
                    }
                    .frame(width: widthUnit * 256)
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(width: widthUnit * 20, alignment: .center)
                    
                    VStack {
                        Text("\(hours)")
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.center)
                        Text("hours")
                            .font(.system(size: widthUnit * 32))
                    }
                    .frame(width: widthUnit * 256)
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(width: widthUnit * 20, alignment: .center)
                    
                    VStack {
                        Text("\(minutes)")
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.center)
                        Text("minutes")
                            .font(.system(size: widthUnit * 32))
                    }
                    .frame(width: widthUnit * 256)
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(width: widthUnit * 20, alignment: .center)
                    
                    VStack {
                        Text("\(seconds)")
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.center)
                        Text("seconds")
                            .font(.system(size: widthUnit * 32))
                    }
                    .frame(width: widthUnit * 256)
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(width: widthUnit * 20, alignment: .center)
                    
                    VStack {
                        Text("\(milliseconds)")
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.center)
                        Text("milliseconds")
                            .font(.system(size: widthUnit * 32))
                    }
                    .frame(width: widthUnit * 256)
                    Spacer()
                }
                .font(.system(size: widthUnit * 116, weight: .medium, design: .default))
                .monospacedDigit()
                .frame(height: 100)
                
                Spacer()
                
                Text("Good luck")
                    .font(.largeTitle)
                    .padding(.bottom, 32)
            }
            .padding(widthUnit * 95)
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(Color("SwiftUIAcademy.Gray"))
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
        .background(.black)
        .onReceive(timer) { _ in
            calculateDate()
        }
    }
    
    func calculateDate() {
        let calendar = Calendar.current
        let now = Date()
        
        let rawDays = calendar.dateComponents([.day], from: now, to: submissionDate).day ?? 0
        let rawHours = (calendar.dateComponents([.hour], from: now, to: submissionDate).hour ?? 0)
        let rawMinutes = (calendar.dateComponents([.minute], from: now, to: submissionDate).minute ?? 0)
        let rawseconds = (calendar.dateComponents([.second], from: now, to: submissionDate).second ?? 0)
        
        withAnimation {
            days = calendar.dateComponents([.day], from: now, to: submissionDate).day ?? 0
            hours = (calendar.dateComponents([.hour], from: now, to: submissionDate).hour ?? 0) - rawDays * 24
            minutes = (calendar.dateComponents([.minute], from: now, to: submissionDate).minute ?? 0) - (rawHours * 60)
            seconds = (calendar.dateComponents([.second], from: now, to: submissionDate).second ?? 0) - rawMinutes * 60
            milliseconds = Int(submissionDate.timeIntervalSince(now) * 1000) - rawseconds * 1000
        }
    }
}

#Preview {
    CountdownView()
}
