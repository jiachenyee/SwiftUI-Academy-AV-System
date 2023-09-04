//
//  DashboardHighlightedModifier.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

struct DashboardHighlightedModifier: ViewModifier {
    
    var isEnabled: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(color, lineWidth: isEnabled ? 4 : 0)
            }
    }
}

extension View {
    func dashboardHighlighted(isEnabled: Bool, color: Color) -> some View {
        self.modifier(DashboardHighlightedModifier(isEnabled: isEnabled, color: color))
    }
}

#Preview {
    DashboardElement(icon: {
        Image(systemName: "hand.wave")
            .foregroundStyle(.yellow)
    }, title: "Demo Title") {
        Text("Test")
    }
    .frame(width: 400)
    .modifier(DashboardHighlightedModifier(isEnabled: true, color: .yellow))
    .padding()
}
