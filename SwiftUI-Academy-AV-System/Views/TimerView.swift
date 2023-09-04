//
//  TimerView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI
import Subsonic

struct TimerView: View {
    
    @ObservedObject var soundPlayer: SubsonicPlayer
    
    var timeInterval: TimeInterval
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var timeElapsed: TimeInterval = 0
    
    @State private var minutes = "00"
    @State private var seconds = "00"
    
    @State private var timesUp = false
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            if !timesUp {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text("\(Int(round(timeInterval / 60)))-minute timer")
                        .foregroundStyle(.white)
                        .font(.system(size: widthUnit * 55, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                    Text("\(minutes):\(seconds)")
                        .monospacedDigit()
                        .contentTransition(.numericText())
                        .foregroundStyle(Color("SwiftUIAcademy"))
                        .font(.system(size: widthUnit * 300, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding(widthUnit * 95)
                
                GeometryReader { geometry in
                    Rectangle()
                        .fill(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Rectangle()
                        .fill(Color("SwiftUIAcademy"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: (timeElapsed / timeInterval) * geometry.size.width)
                }
                .frame(height: 32)
                .padding(widthUnit * 95)
            } else {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text("\(Int(round(timeInterval / 60)))-minute timer")
                        .foregroundStyle(.white)
                        .font(.system(size: widthUnit * 55, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                    Text("Times Up!")
                        .foregroundStyle(Color("SwiftUIAcademy"))
                        .font(.system(size: widthUnit * 300, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding(widthUnit * 95)
            }
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(Color("SwiftUIAcademy.Gray"))
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
        .background(.black)
        .onAppear {
            timeElapsed = 0
            display(timeRemaining: timeInterval - timeElapsed)
        }
        .onReceive(timer) { _ in
            timeElapsed += 0.1
            display(timeRemaining: timeInterval - timeElapsed)
        }
    }
    
    func display(timeRemaining: TimeInterval) {
        let minutesReading = Int(floor(timeRemaining / 60))
        let secondsReading = Int(timeRemaining.truncatingRemainder(dividingBy: 60))
        
        withAnimation(.spring()) {
            if minutesReading <= 9 {
                minutes = "0\(minutesReading)"
            } else {
                minutes = "\(minutesReading)"
            }
            
            if secondsReading <= 9 {
                seconds = "0\(secondsReading)"
            } else {
                seconds = "\(secondsReading)"
            }
        }
        
        if timeRemaining <= 0 && !timesUp {
            withAnimation {
                timesUp = true
            }
            
            soundPlayer.play()
        }
    }
}

#Preview {
    TimerView(soundPlayer: .init(sound: "radar.m4a"), timeInterval: 500)
}
