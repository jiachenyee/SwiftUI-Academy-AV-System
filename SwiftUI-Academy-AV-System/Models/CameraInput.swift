//
//  CameraInput.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import AVFoundation

struct CameraInput: Identifiable {
    var id: String {
        captureDevice.uniqueID
    }
    
    var name: String {
        captureDevice.localizedName
    }
    
    var captureDevice: AVCaptureDevice
    
    init(_ captureDevice: AVCaptureDevice) {
        self.captureDevice = captureDevice
    }
}
