//
//  AppleTVView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct AppleTVView: View {
    
    var zoomState: ZoomPosition
    @ObservedObject var cameraViewModel: CameraViewModel
    
    var body: some View {
        CameraView(session: cameraViewModel.session)
            .scaleEffect(zoomState.scale, anchor: zoomState.unitPoint)
    }
}

#Preview {
    AppleTVView(zoomState: .normal, cameraViewModel: CameraViewModel())
}
