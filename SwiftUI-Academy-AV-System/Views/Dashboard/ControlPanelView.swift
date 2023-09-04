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
                    
                    DashboardElement(icon: {
                        Image(systemName: "eyes.inverse")
                            .foregroundStyle(.cyan)
                    }, title: "Holding") {
                        
                    }
                    
                    DashboardElement(icon: {
                        Image(systemName: "takeoutbag.and.cup.and.straw")
                            .foregroundStyle(.blue)
                    }, title: "Lunch") {
                        
                    }
                    
                    DashboardElement(icon: {
                        Image(systemName: "appletv.fill")
                    }, title: "Hot Chocolate") {
                        
                    }
                    
                    DashboardElement(icon: {
                        Image(systemName: "timer")
                            .foregroundStyle(.orange)
                    }, title: "Timer") {
                        Text("lol")
                        Button("Start Timer") {
                            
                        }
                    }
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
