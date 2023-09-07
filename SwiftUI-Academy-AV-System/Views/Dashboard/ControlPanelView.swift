//
//  ControlPanelView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI
import Subsonic

struct ControlPanelView: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var cameraViewModel: CameraViewModel
    @ObservedObject var soundPlayer: SubsonicPlayer
    
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
                    HoldingPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isHolding, color: .cyan)
                    
                    FruitEmojiPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isFruitEmoji, color: .green)
                    
                    AppleTVPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isTV, color: .white)
                    
                    
                    DashboardElement(icon: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.red)
                    }, title: "Presentation Order") {
                        Text("Display the presentation order with needlessly anticipatory animation.")
                        Spacer()
                        Button("Connect to Display") {
                            withAnimation {
                                viewModel.state = .presentationOrder
                            }
                        }
                        .keyboardShortcut(KeyboardShortcut("5", modifiers: .command))
                    }
                    .dashboardHighlighted(isEnabled: viewModel.state.isPresentationOrder, color: .red)
                    
                    WelcomePresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isWelcome, color: .yellow)
                    
                    TimerPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isTimer, color: .orange)
                    
                    StatementPresentationDashboardItem(state: $viewModel.state)
                        .dashboardHighlighted(isEnabled: viewModel.state.isStatement, color: .purple)
                }
                
                DashboardSection(systemName: "speaker.wave.2", title: "Audio") {
                    DashboardElement(icon: {
                        Image(systemName: "play.fill")
                            .foregroundStyle(.green)
                    }, title: "Play/Pause") {
                        Text("Radar Alarm Sound")
                        HStack {
                            Button {
                                soundPlayer.play()
                            } label: {
                                Image(systemName: "play.fill")
                                    .frame(width: 32, height: 32)
                            }
                            Button {
                                soundPlayer.stop()
                            } label: {
                                Image(systemName: "stop.fill")
                                    .frame(width: 32, height: 32)
                            }
                        }
                    }
                }
                
                DashboardSection(systemName: "av.remote", title: "Remote Control") {
                    RemoteControlDashboardItem(viewModel: viewModel)
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
    ControlPanelView(viewModel: ViewModel(), cameraViewModel: CameraViewModel(), soundPlayer: .init(sound: "radar.m4a"))
}
