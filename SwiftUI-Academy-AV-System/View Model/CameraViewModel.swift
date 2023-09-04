//
//  CameraViewModel.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import AVFoundation

class CameraViewModel: ObservableObject {
    @Published var cameras: [CameraInput] = []
    
    @Published var selectedCameraID = "" {
        didSet {
            print(selectedCameraID)
            changeCamera()
        }
    }
    
    let session = AVCaptureSession()
    
    init() {
        refreshCameras()
        setupSession()
    }
    
    func changeCamera() {
        session.beginConfiguration()
        defer { session.commitConfiguration() }
        
        guard let cameraInput = cameras.first(where: {
            $0.id == selectedCameraID
        }) else { return }
        
        let camera = cameraInput.captureDevice
        
        for input in session.inputs {
            session.removeInput(input)
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: camera)
            
            if session.canAddInput(input) {
                session.addInput(input)
            } else {
                print("Unable to add camera input to session!")
            }
        } catch {
            print("Error setting up camera input: \(error)")
        }
    }
    
    func setupSession() {
        session.beginConfiguration()
        defer { session.commitConfiguration() }
        
        // Check for camera permission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            break
            
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.setupInput()
                }
            }
            
        default:
            // The user has previously denied access.
            print("Camera access was denied.")
            return
        }
        
        setupInput()
    }
    
    private func setupInput() {
        guard let camera = AVCaptureDevice.default(for: .video) else {
            print("Unable to access the camera!")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: camera)
            
            print(input)
            
            if session.canAddInput(input) {
                session.addInput(input)
            } else {
                print("Unable to add camera input to session!")
            }
        } catch {
            print("Error setting up camera input: \(error)")
        }
    }
    
    func startSession() {
        if !session.isRunning {
            session.startRunning()
        }
    }
    
    func stopSession() {
        if session.isRunning {
            session.stopRunning()
        }
    }
    
    func refreshCameras() {
        cameras = getAvailableCameras()
    }
    
    private func getAvailableCameras() -> [CameraInput] {
        let deviceTypes: [AVCaptureDevice.DeviceType] = [.builtInWideAngleCamera, .external]
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: deviceTypes, mediaType: .video, position: .unspecified)
        
        return discoverySession.devices.map { CameraInput($0) }
    }
}
