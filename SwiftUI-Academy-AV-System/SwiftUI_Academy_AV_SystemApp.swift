//
//  SwiftUI_Academy_AV_SystemApp.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

@main
struct SwiftUI_Academy_AV_SystemApp: App {
    
    @StateObject private var cameraViewModel = CameraViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(cameraViewModel: cameraViewModel)
        }
        
        Window("Control Panel", id: "controlpanel") {
            ControlPanelView(cameraViewModel: cameraViewModel)
        }
    }
}
