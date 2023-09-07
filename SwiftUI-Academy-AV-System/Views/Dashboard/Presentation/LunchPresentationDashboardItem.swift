//
//  LunchPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct LunchPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    @State private var returnTime = "1pm"
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "takeoutbag.and.cup.and.straw")
                .foregroundStyle(.blue)
        }, title: "Lunch") {
            Text("Come back at")
            TextField("time", text: $returnTime)
            
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .lunch(returnTime)
                }
            }
        }
    }
}

#Preview {
    LunchPresentationDashboardItem(state: .constant(.tv(.normal, false)))
}
