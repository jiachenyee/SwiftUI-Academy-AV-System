//
//  PresentationState.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

enum ZoomPosition: Codable {
    case topLeading
    case bottomLeading
    case topTrailing
    case bottomTrailing
    case center
    case normal
    
    var scale: CGFloat {
        switch self {
        case .topLeading, .bottomLeading, .topTrailing, .bottomTrailing, .center: return 1.5
        case .normal: return 1
        }
    }
    
    var unitPoint: UnitPoint {
        switch self {
        case .topLeading: return .topLeading
        case .bottomLeading: return .bottomLeading
        case .topTrailing: return .topTrailing
        case .bottomTrailing: return .bottomTrailing
        case .normal, .center: return .center
        }
    }
}

enum PresentationState: Codable, Equatable {
    case welcome(String)
    case statement(String)
    case presentationOrder
    case holding(String, String)
    case tv(ZoomPosition, Bool)
    case fruitEmoji(String)
    case lunch(String) // Unused
    case timer(TimeInterval)
    case countdown // Unused
    
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
    
    var isFruitEmoji: Bool {
        switch self {
        case .fruitEmoji: return true
        default: return false
        }
    }
    
    var isPresentationOrder: Bool {
        switch self {
        case .presentationOrder: return true
        default: return false
        }
    }
    
    var isStatement: Bool {
        switch self {
        case .statement: return true
        default: return false
        }
    }
}
