//
//  DashboardAppleTVLivePreview.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct DashboardAppleTVLivePreview: View {
    
    @ObservedObject var cameraViewModel: CameraViewModel
    
    var body: some View {
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
}

#Preview {
    DashboardAppleTVLivePreview(cameraViewModel: CameraViewModel())
}
