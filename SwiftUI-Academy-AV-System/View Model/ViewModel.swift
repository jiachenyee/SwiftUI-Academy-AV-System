//
//  ViewModel.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var state = PresentationState.welcome("Day 2") {
        didSet {
            print(state)
        }
    }
    
}