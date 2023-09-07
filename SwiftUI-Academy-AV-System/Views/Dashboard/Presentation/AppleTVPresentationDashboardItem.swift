//
//  AppleTVPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct AppleTVPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    @State private var position: ZoomPosition = .normal
    
    @State private var startDate: Date?
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "appletv.fill")
        }, title: "Apple TV") {
//            Text("Zoom Position")
//            Button("Reset to Normal") {
//                withAnimation {
//                    position = .normal
//                    state = .tv(position, false)
//                }
//            }
//            HStack {
//                Button {
//                    withAnimation {
//                        position = .topLeading
//                        state = .tv(position, false)
//                    }
//                } label: {
//                    Image(systemName: "rectangle.inset.topleading.filled")
//                }
//                Button {
//                    withAnimation {
//                        position = .bottomLeading
//                        state = .tv(position, false)
//                    }
//                } label: {
//                    Image(systemName: "rectangle.inset.bottomleading.filled")
//                }
//                Button {
//                    withAnimation {
//                        position = .topTrailing
//                        state = .tv(position, false)
//                    }
//                } label: {
//                    Image(systemName: "rectangle.inset.toptrailing.filled")
//                }
//                Button {
//                    withAnimation {
//                        position = .bottomTrailing
//                        state = .tv(position, false)
//                    }
//                } label: {
//                    Image(systemName: "rectangle.inset.bottomtrailing.filled")
//                }
//            }

            if let startDate, state.isTV {
                Text(startDate, style: .timer)
                    .font(.title)
            }
            
            Spacer()
            
            Button("Connect Normal") {
                withAnimation {
                    state = .tv(position, false)
                }
                startDate = .now
            }
            .keyboardShortcut(KeyboardShortcut("3", modifiers: .command))
            
            Button("Connect Feedback") {
                withAnimation {
                    state = .tv(.normal, true)
                }
                startDate = .now
            }
            .keyboardShortcut(KeyboardShortcut("4", modifiers: .command))
        }
    }
}

#Preview {
    AppleTVPresentationDashboardItem(state: .constant(.tv(.normal, false)))
}
