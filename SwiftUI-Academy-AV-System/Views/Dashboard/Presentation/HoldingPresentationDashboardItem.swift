//
//  HoldingPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct HoldingPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    @State private var title = ""
    @State private var subtitle = ""
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "eyes.inverse")
                .foregroundStyle(.cyan)
        }, title: "Holding") {
            Text("Title")
            TextField("Title", text: $title)
            
            Text("Subtitle")
            TextField("Subtitle", text: $subtitle)
            
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .holding(title, subtitle)
                }
            }
            .keyboardShortcut(KeyboardShortcut("1", modifiers: .command))
        }
    }
}

#Preview {
    HoldingPresentationDashboardItem(state: .constant(.tv(.normal, false)))
}
