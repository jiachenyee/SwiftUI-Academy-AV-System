//
//  MCBrowserManager.swift
//  AV Remote Control
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import MultipeerConnectivity

class MCBrowserManager: NSObject, MCNearbyServiceBrowserDelegate {
    
    let browser: MCNearbyServiceBrowser
    
    private let peerID: MCPeerID
    private var session: MCSession
    
    init(session: MCSession) {
        peerID = session.myPeerID
        browser = MCNearbyServiceBrowser(peer: peerID, serviceType: MultipeerConstant.service)
        self.session = session
        
        super.init()
        
        browser.delegate = self
    }
    
    func start() {
        browser.startBrowsingForPeers()
    }
    
    func stop() {
        browser.stopBrowsingForPeers()
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print(error.localizedDescription)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 60)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("lost", peerID.displayName)
    }
}
