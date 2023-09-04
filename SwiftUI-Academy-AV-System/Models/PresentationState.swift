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
}
