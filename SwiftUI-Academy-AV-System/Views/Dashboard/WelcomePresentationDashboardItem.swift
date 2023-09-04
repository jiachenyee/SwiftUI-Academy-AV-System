//
//  WelcomePresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct WelcomePresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    @State private var subtitle = "Day 1"
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "hand.wave")
                .foregroundStyle(.yellow)
        }, title: "Welcome") {
            
            TextField("Subtitle", text: $subtitle)
            
            Spacer()
            
            Button("Display") {
                state = .welcome(subtitle)
            }
            .onChange(of: subtitle) { oldValue, newValue in
                switch state {
                case .welcome: state = .welcome(newValue)
                default: break
                }
            }
        }
        
    }
}

#Preview {
    WelcomePresentationDashboardItem(state: .constant(.tv))
}
