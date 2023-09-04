//
//  DashboardCaptureCameraSettings.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct DashboardCaptureCameraSettings: View {
    
    @ObservedObject var cameraViewModel: CameraViewModel
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "camera")
        }, title: "Capture Camera") {
            Text("Select the Apple TV HDMI capture camera.")
            
            Picker(selection: $cameraViewModel.selectedCameraID) {
                ForEach(cameraViewModel.cameras) { camera in
                    Text(camera.name)
                        .id(camera.id)
                }
            } label: {
                EmptyView()
            }
            
            Spacer()
            
            Button("Refresh Camera List") {
                cameraViewModel.refreshCameras()
            }
        }
    }
}

#Preview {
    DashboardCaptureCameraSettings(cameraViewModel: CameraViewModel())
}
