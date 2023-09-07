//
//  ContentView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI
import Subsonic

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var cameraViewModel: CameraViewModel
    @ObservedObject var soundPlayer: SubsonicPlayer
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .welcome(let subtitle):
                WelcomeView(subtitle: subtitle)
            case .holding(let title, let subtitle):
                HoldingView(title: title, subtitle: subtitle)
            case .timer(let timeInterval):
                TimerView(soundPlayer: soundPlayer, timeInterval: timeInterval)
            case .lunch(let returnTime):
                LunchView(returnTime: returnTime)
            case .countdown:
                CountdownView()
            case .tv(let zoomState, let showTimer):
                AppleTVView(isFeedbackState: showTimer, zoomState: zoomState, cameraViewModel: cameraViewModel)
            case .statement(let text):
                StatementView(text: text)
            case .presentationOrder:
                PresentationOrderView()
            case .fruitEmoji(let emoji):
                FruitEmojiView(emoji: emoji)
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
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
    ContentView(viewModel: ViewModel(), cameraViewModel: CameraViewModel(), soundPlayer: SubsonicPlayer(sound: "radar.m4a"))
}
