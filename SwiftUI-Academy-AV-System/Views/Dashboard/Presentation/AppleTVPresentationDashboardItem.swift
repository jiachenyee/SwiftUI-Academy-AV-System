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
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "appletv.fill")
        }, title: "Hot Chocolate") {
            Text("Zoom Position")
            Button("Reset to Normal") {
                withAnimation {
                    position = .normal
                    state = .tv(position)
                }
            }
            HStack {
                Button {
                    withAnimation {
                        position = .topLeading
                        state = .tv(position)
                    }
                } label: {
                    Image(systemName: "rectangle.inset.topleading.filled")
                }
                Button {
                    withAnimation {
                        position = .bottomLeading
                        state = .tv(position)
                    }
                } label: {
                    Image(systemName: "rectangle.inset.bottomleading.filled")
                }
                Button {
                    withAnimation {
                        position = .topTrailing
                        state = .tv(position)
                    }
                } label: {
                    Image(systemName: "rectangle.inset.toptrailing.filled")
                }
                Button {
                    withAnimation {
                        position = .bottomTrailing
                        state = .tv(position)
                    }
                } label: {
                    Image(systemName: "rectangle.inset.bottomtrailing.filled")
                }
            }

            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .tv(position)
                }
            }
        }
    }
}

#Preview {
    AppleTVPresentationDashboardItem(state: .constant(.tv(.normal)))
}
