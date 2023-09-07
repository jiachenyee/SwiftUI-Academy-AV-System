//
//  StatementPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 8/9/23.
//

import SwiftUI

struct StatementPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    @State private var title = "**Opening** by George."
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "abc")
                .foregroundStyle(.purple)
        }, title: "Statement") {
            TextField("Title", text: $title)
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .statement(title)
                }
            }
            .keyboardShortcut(KeyboardShortcut("8", modifiers: .command))
        }
    }
}
