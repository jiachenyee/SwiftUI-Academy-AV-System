//
//  ContentView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var cameraViewModel: CameraViewModel
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .welcome(let subtitle):
                Text("Welcome: \(subtitle)")
            case .timer(let timeInterval):
                Text("Timer")
            case .lunch(let returnTime):
                Text("Lunch")
            case .holding:
                Text("Holding")
            case .tv:
                CameraView(session: cameraViewModel.session)
            }
        }
        .onAppear {
            openWindow(id: "controlpanel")
            cameraViewModel.startSession()
        }
        .onDisappear {
            cameraViewModel.stopSession()
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel(), cameraViewModel: CameraViewModel())
}
