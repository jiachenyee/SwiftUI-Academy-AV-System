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
    @State private var tempState: PresentationState = .welcome("")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TabView {
                    WelcomePresentationDashboardItem(state: $tempState)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                    HoldingPresentationDashboardItem(state: $tempState)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                    AppleTVPresentationDashboardItem(state: $tempState)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                    LunchPresentationDashboardItem(state: $tempState)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                    TimerPresentationDashboardItem(state: $tempState)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                }
                .textFieldStyle(.roundedBorder)
                .buttonStyle(.bordered)
                .tabViewStyle(.page)
                .frame(height: 400)
                
                Rectangle()
                    .opacity(0)
                    .frame(height: 100)
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
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()

            }
            .confirmationDialog("Are you sure you want to disconnect?", isPresented: $confirmDisconnection) {
                Button("Disconnect", role: .destructive) {
                    viewModel.browserManager.stop()
                    viewModel.mcSession.disconnect()
                }
                
                Button("Cancel", role: .cancel) {}
            }
            .onChange(of: tempState) { newValue in
                viewModel.send(state: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
