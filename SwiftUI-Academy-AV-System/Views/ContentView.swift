//
//  ContentView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var cameraViewModel = CameraViewModel()
    
    var body: some View {
        VStack {
            CameraView(session: cameraViewModel.session)
                .onAppear {
                    cameraViewModel.startSession()
                }
                .onDisappear {
                    cameraViewModel.stopSession()
                }
            
            ControlPanelView(cameraViewModel: cameraViewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
