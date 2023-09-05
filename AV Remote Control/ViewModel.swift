//
//  ViewModel.swift
//  AV Remote Control
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import MultipeerConnectivity

class ViewModel: NSObject, ObservableObject {
    
    var hostPeerID: MCPeerID?
    
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var browserManager: MCBrowserManager!
    
    @Published var state = PresentationState.welcome("Day 2")
    @Published var isConnected = false
    
    let deviceId = UUID().uuidString
    
    override init() {
        super.init()
        setUpMultipeerConnectivity()
    }
    
    func send(state: PresentationState) {
        let jsonData = try! JSONEncoder().encode(state)
        
        try! mcSession.send(jsonData, toPeers: mcSession.connectedPeers, with: .reliable)
    }
}
