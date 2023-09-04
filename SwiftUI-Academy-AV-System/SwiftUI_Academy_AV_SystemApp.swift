//
//  SwiftUI_Academy_AV_SystemApp.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI
import Subsonic

@main
struct SwiftUI_Academy_AV_SystemApp: App {
    
    @StateObject private var cameraViewModel = CameraViewModel()
    @StateObject private var viewModel = ViewModel()
    @StateObject private var soundPlayer = SubsonicPlayer(sound: "radar.m4a")
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel, cameraViewModel: cameraViewModel, soundPlayer: soundPlayer)
        }
        
        Window("Control Panel", id: "controlpanel") {
            ControlPanelView(viewModel: viewModel, cameraViewModel: cameraViewModel, soundPlayer: soundPlayer)
        }
    }
}
