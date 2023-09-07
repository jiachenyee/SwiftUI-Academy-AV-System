//
//  WelcomeView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var colors = [Color.green, Color.yellow, Color.orange]
    
    var subtitle: String
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            Color.black
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text("Welcome to Apple.")
                    .foregroundStyle(.white)
                    .font(.system(size: widthUnit * 80, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, widthUnit * 36)
                
                VStack(spacing: widthUnit * 8) {
                    HStack {
                        Image(systemName: "sparkles.rectangle.stack")
                            .frame(width: widthUnit * 40)
                            .foregroundStyle(.yellow)
                        
                        Text("Prepare your materials.")
                            .padding(.leading, widthUnit * 21)
                        
                        Spacer()
                    }
                    .font(.system(size: widthUnit * 36, design: .default))
                    
                    HStack {
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor)
                            .frame(width: widthUnit * 40)
                            .foregroundStyle(.blue)
                        
                        Text("Connect to Apple Guest Wi-Fi.")
                            .padding(.leading, widthUnit * 21)
                        Spacer()
                    }
                    .font(.system(size: widthUnit * 36, design: .default))
                    
                    HStack {
                        Image(systemName: "camera")
                            .frame(width: widthUnit * 40)
                            .foregroundStyle(.gray)
                        
                        Text("You may take photos within this room.")
                            .padding(.leading, widthUnit * 21)
                        Spacer()
                    }
                    .font(.system(size: widthUnit * 36, design: .default))
                }
                .frame(width: widthUnit * 700)
                .frame(maxWidth: .infinity)
                .padding(.bottom, widthUnit * 36)
                
                Spacer()
                
                Text("We will begin shortly.")
                    .foregroundStyle(.white)
                    .font(.system(size: widthUnit * 32, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity)
            }
            .padding(widthUnit * 95)
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(.swiftUIAcademyGray)
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                colors = [.yellow, .orange]
            }
        }
    }
}

#Preview {
    WelcomeView(subtitle: "Day 2")
}
