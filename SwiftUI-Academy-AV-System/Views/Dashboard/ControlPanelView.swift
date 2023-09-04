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
            Text("Control Panel")
                .padding(8)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                HStack {
                    Image(systemName: "airplayvideo")
                    Text("AirPlay")
                }
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 400), spacing: 16)], spacing: 16) {
                    DashboardElement(icon: {
                        Image(systemName: "camera")
                    }, title: "Apple TV Capture Camera") {
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
                    
                    DashboardElement(icon: {
                        Image(systemName: "appletv.fill")
                    }, title: "Apple TV Preview") {
                        ZStack {
                            VStack {
                                Image(systemName: "pc")
                                Text("Uh oh, something broke.")
                            }
                            CameraView(session: cameraViewModel.session)
                        }
                        .background(.background)
                        .aspectRatio(16 / 9, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.top, 8)
                Divider()
                    .padding(.vertical, 8)
            }
            .frame(minWidth: 200)
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .padding()
    
    }
}

#Preview {
    ControlPanelView(cameraViewModel: .init())
}
