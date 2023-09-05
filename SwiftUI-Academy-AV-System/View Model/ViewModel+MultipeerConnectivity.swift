//
//  ViewModel+MultipeerConnectivity.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import MultipeerConnectivity
import SwiftUI

extension ViewModel {
    func startHosting() {
        isHosting = true
        peerID = MCPeerID(displayName: Host.current().localizedName!)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        
        mcSession!.delegate = self
        
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: MultipeerConstant.service,
                                                      discoveryInfo: nil,
                                                      session: mcSession!)
        mcAdvertiserAssistant?.start()
        
        print("Multipeer Session Started")
    }
    
    func stopHosting() {
        guard let mcSession else { return }
        isHosting = false
        mcSession.disconnect()
        mcAdvertiserAssistant.stop()
        
        self.mcSession = nil
        print("Multipeer Session Ended")
    }
}

extension ViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        Task {
            await MainActor.run {
                connectedPeers = session.connectedPeers.count
            }
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        didReceiveData(data, from: peerID)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func didReceiveData(_ data: Data, from peerID: MCPeerID) {
        let decoder = JSONDecoder()
        do {
            let presentationState = try decoder.decode(PresentationState.self, from: data)
            
            Task {
                await MainActor.run {
                    withAnimation {
                        self.state = presentationState
                    }
                }
            }
        } catch {
            print("Unable to decode data from \(peerID.displayName): \(data.count) bytes")
        }
    }
}
