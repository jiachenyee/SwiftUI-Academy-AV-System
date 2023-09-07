//
//  FruitEmojiView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 7/9/23.
//

import SwiftUI

struct FruitEmojiView: View {
    
    var emoji: String
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            Color.black
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                
                Text(emoji)
                    .foregroundStyle(.white)
                    .font(.system(size: widthUnit * 256, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(.swiftUIAcademyGray)
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
    }
}

#Preview {
    FruitEmojiView(emoji: "🥔")
}
