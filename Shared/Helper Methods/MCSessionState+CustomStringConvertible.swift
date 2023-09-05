//
//  MCSessionState+CustomStringConvertible.swift
//  AV Remote Control
//
//  Created by Jia Chen Yee on 6/9/23.
//

import Foundation
import MultipeerConnectivity

extension MCSessionState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notConnected: return "notConnected"
        case .connecting: return "connecting"
        case .connected: return "connected"
        @unknown default: fatalError()
        }
    }
}
