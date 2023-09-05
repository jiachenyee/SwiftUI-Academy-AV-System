//
//  RemoteControlDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct RemoteControlDashboardItem: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        DashboardElement(icon: {
            if viewModel.connectedPeers >= 1 {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "antenna.radiowaves.left.and.right.slash")
                    .foregroundStyle(.red)
            }
            
        }, title: "Connection") {
            HStack {
                Text("Hosting")
                Spacer()
                if viewModel.isHosting {
                    Button("Stop") {
                        viewModel.stopHosting()
                    }
                } else {
                    Button("Start") {
                        viewModel.startHosting()
                    }
                }
            }
            
            Text("Connected Remotes: \(viewModel.connectedPeers)")
                .monospacedDigit()
        }
    }
}

#Preview {
    RemoteControlDashboardItem(viewModel: ViewModel())
}
