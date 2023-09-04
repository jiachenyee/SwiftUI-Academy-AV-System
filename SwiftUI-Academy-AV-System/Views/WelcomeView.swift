//
//  WelcomeView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var colors = [Color.yellow, Color.orange]
    
    var subtitle: String
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            LinearGradient(colors: colors, startPoint: .bottomLeading, endPoint: .topTrailing)
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text("Welcome Back.")
                    .foregroundStyle(.black)
                    .font(.system(size: widthUnit * 116, weight: .bold, design: .default))
                Text(subtitle)
                    .foregroundStyle(.black)
                    .font(.system(size: widthUnit * 55, weight: .bold, design: .default))
                Spacer()
            }
            .padding(widthUnit * 95)
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(.black.opacity(0.6))
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
