//
//  CameraView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraView: NSViewRepresentable {
    let session: AVCaptureSession
    
    func makeNSView(context: Context) -> NSView {
        let previewView = NSView(frame: .zero)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = previewView.bounds
        previewLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        previewView.layer = previewLayer
        previewView.wantsLayer = true
        
        return previewView
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}

