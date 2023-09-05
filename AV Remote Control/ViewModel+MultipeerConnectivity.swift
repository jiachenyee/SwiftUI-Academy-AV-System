//
//  ViewModel+MultipeerConnectivity.swift
//  AV Remote Control
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import MultipeerConnectivity

extension ViewModel: MCSessionDelegate {
    func setUpMultipeerConnectivity() {
        peerID = MCPeerID(displayName: deviceId)
        mcSession = MCSession(peer: peerID,
                              securityIdentity: nil,
                              encryptionPreference: .none)
        mcSession.delegate = self
        
        browserManager = MCBrowserManager(session: mcSession)
    }
    
    func startSearching() {
        browserManager.start()
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        hostPeerID = peerID
        
        print("State:", state.description)
        
        if state == .connected {
            Task {
                await MainActor.run {
                    isConnected = session.connectedPeers.count >= 1
                }
            }
            
            browserManager.stop()
        } else if state == .notConnected {
            Task {
                await MainActor.run {
                    isConnected = session.connectedPeers.count >= 1
                }
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
                    state = presentationState
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
