//
//  TimerPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct TimerPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    @State private var minutes: Int = 10
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "timer")
                .foregroundStyle(.orange)
        }, title: "Timer") {
            Text("Number of Minutes")
            TextField("0 minutes", value: $minutes, formatter: NumberFormatter())
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .timer(TimeInterval(minutes * 60))
                }
            }
        }
    }
}

#Preview {
    TimerPresentationDashboardItem(state: .constant(.tv))
}
