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
            Text("Slide Subtitle")
            TextField("Subtitle", text: $subtitle)
#if os(macOS)
                .onSubmit {
                    switch state {
                    case .welcome: state = .welcome(subtitle)
                    default: break
                    }
                }
#endif
            Spacer()
            
            Button("Connect to Display") {
                withAnimation {
                    state = .welcome(subtitle)
                }
            }
        }
    }
}

#Preview {
    WelcomePresentationDashboardItem(state: .constant(.tv(.normal)))
}
