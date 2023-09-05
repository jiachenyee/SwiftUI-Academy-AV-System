//
//  ViewModel.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import MultipeerConnectivity

class ViewModel: NSObject, ObservableObject {
    
    var peerID: MCPeerID!
    var mcSession: MCSession?
    var mcAdvertiserAssistant: MCAdvertiserAssistant!

    @Published var state = PresentationState.welcome("Day 2")
    @Published var connectedPeers = 0
    @Published var isHosting = false
    
    let deviceId = UUID().uuidString
    
    override init() {
        super.init()
        
    }
}
