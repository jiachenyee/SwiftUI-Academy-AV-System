//
//  ContentView.swift
//  AV Remote Control
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var confirmDisconnection = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Presentation") {
                    
                }
                
                Section("Audio") {
                    
                }
            }
            .navigationTitle("AV System")
            .overlay(alignment: .bottomLeading) {
                Button {
                    if !viewModel.isConnected {
                        viewModel.startSearching()
                    } else {
                        confirmDisconnection.toggle()
                    }
                } label: {
                    HStack {
                        Image(systemName: viewModel.isConnected ? "antenna.radiowaves.left.and.right" : "antenna.radiowaves.left.and.right.slash")
                            .foregroundStyle(viewModel.isConnected ? .green : .red)
                        Text(viewModel.isConnected ? "Connected" : "Disconnected")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                }
                .buttonStyle(.bordered)
                .padding()

            }
            .confirmationDialog("Are you sure you want to disconnect?", isPresented: $confirmDisconnection) {
                Button("Disconnect", role: .destructive) {
                    viewModel.browserManager.stop()
                    viewModel.mcSession.disconnect()
                }
                
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

#Preview {
    ContentView()
}
