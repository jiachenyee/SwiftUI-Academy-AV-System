//
//  PresentationOrderPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 8/9/23.
//

import SwiftUI

struct PresentationOrderPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "list.bullet")
                .foregroundStyle(.red)
        }, title: "Presentation Order") {
            Text("Display the presentation order with needlessly anticipatory animation.")
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .presentationOrder
                }
            }
            .keyboardShortcut(KeyboardShortcut("5", modifiers: .command))
        }
    }
}
