//
//  ControlPanelView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

struct ControlPanelView: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var cameraViewModel: CameraViewModel
    
    var body: some View {
        VStack {
            Text("Control Panel")
                .padding(8)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                DashboardSection(systemName: "airplayvideo", title: "AirPlay") {
                    DashboardCaptureCameraSettings(cameraViewModel: cameraViewModel)
                    DashboardAppleTVLivePreview(cameraViewModel: cameraViewModel)
                }
                
                DashboardSection(systemName: "sparkles.tv", title: "Presentation") {
                    WelcomePresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isWelcome, color: .yellow)
                    
                    HoldingPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isHolding, color: .cyan)
                    
                    LunchPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isLunch, color: .blue)
                    
                    AppleTVPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isTV, color: .white)
                    
                    TimerPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isTimer, color: .orange)
                }
            }
            .frame(minWidth: 200)
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .padding()
    
    }
}

#Preview {
    ControlPanelView(viewModel: ViewModel(), cameraViewModel: CameraViewModel())
}
