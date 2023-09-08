//
//  AppleTVView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct AppleTVView: View {
    
    var isFeedbackState: Bool
    var zoomState: ZoomPosition
    @ObservedObject var cameraViewModel: CameraViewModel
    
    @State private var timeElapsed: TimeInterval = 0
    
    @State private var minutes = "00"
    @State private var seconds = "00"
    
    @State private var timesUp = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let timeInterval = 480.0
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            Color.black
            
            VStack(spacing: 0) {
                CameraView(session: cameraViewModel.session)
                    .scaleEffect(zoomState.scale, anchor: zoomState.unitPoint)
                    .padding([.horizontal], isFeedbackState ? widthUnit * 95 : 0)
                
                if isFeedbackState {
                    if timesUp {
                        Text("Times' Up!")
                            .foregroundStyle(Color("SwiftUIAcademy"))
                            .font(.system(size: 48))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .frame(height: 32 + widthUnit * 32)
                            .padding([.horizontal], widthUnit * 95)
                    } else {
                        HStack(spacing: 0) {
                            Text("\(minutes):\(seconds)")
                                .contentTransition(.numericText())
                                .monospacedDigit()
                                .font(.system(size: 32))
                                .padding(.trailing, widthUnit * 32)
                            
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(.white.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                Rectangle()
                                    .fill(Color("SwiftUIAcademy"))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .frame(width: (timeElapsed / timeInterval) * geometry.size.width)
                            }
                        }
                        .frame(height: 32)
                        .padding([.top], widthUnit * 32)
                        .padding([.horizontal], widthUnit * 95)
                    }
                }
            }
        }
        .onChange(of: isFeedbackState) { newValue in
            if newValue {
                timeElapsed = 0
                display(timeRemaining: timeInterval - timeElapsed)
            }
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
        }
    }
}

#Preview {
    AppleTVView(isFeedbackState: false, zoomState: .normal, cameraViewModel: CameraViewModel())
}
