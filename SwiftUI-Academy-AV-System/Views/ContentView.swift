//
//  ContentView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cameraViewModel: CameraViewModel
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            CameraView(session: cameraViewModel.session)
                .onAppear {
                    cameraViewModel.startSession()
                }
                .onDisappear {
                    cameraViewModel.stopSession()
                }
        }
        .onAppear {
            openWindow(id: "controlpanel")
        }
    }
}

#Preview {
    ContentView(cameraViewModel: CameraViewModel())
}
