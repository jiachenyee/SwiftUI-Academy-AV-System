//
//  PresentationState.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation

enum PresentationState {
    case welcome(String)
    case holding(String, String)
    /// - Parameters: Return time
    case lunch(String)
    case tv
    case timer(TimeInterval)
    
    var isWelcome: Bool {
        switch self {
        case .welcome: return true
        default: return false
        }
    }
    
    var isHolding: Bool {
        switch self {
        case .holding: return true
        default: return false
        }
    }
    
    var isLunch: Bool {
        switch self {
        case .lunch: return true
        default: return false
        }
    }
    
    var isTV: Bool {
        switch self {
        case .tv: return true
        default: return false
        }
    }
    
    var isTimer: Bool {
        switch self {
        case .timer: return true
        default: return false
        }
    }
}
