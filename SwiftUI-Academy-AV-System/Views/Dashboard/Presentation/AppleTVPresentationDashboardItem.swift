//
//  AppleTVPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct AppleTVPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "appletv.fill")
        }, title: "Hot Chocolate") {
            Text("Display AirPlay to users.")
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .tv
                }
            }
        }
    }
}

#Preview {
    AppleTVPresentationDashboardItem(state: .constant(.tv))
}
