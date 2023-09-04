//
//  ControlPanelView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

struct ControlPanelView: View {
    
    @ObservedObject var cameraViewModel: CameraViewModel
    
    var body: some View {
        VStack {
            DashboardElement(icon: {
                Image(systemName: "camera")
            }, title: "Camera Management") {
                Picker("Cameras", selection: .constant("")) {
                    ForEach(cameraViewModel.cameras) { camera in
                        Text(camera.name)
                    }
                }
                
                Button("Refresh Camera List") {
                    cameraViewModel.refreshCameras()
                }
            }
        }
        .padding()
    
    }
}

#Preview {
    ControlPanelView(cameraViewModel: .init())
}
