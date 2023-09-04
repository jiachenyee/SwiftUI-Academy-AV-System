//
//  LunchView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct LunchView: View {
    
    var returnTime: String
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text("Lunch Break")
                    .foregroundStyle(Color("SwiftUIAcademy"))
                    .font(.system(size: widthUnit * 116, weight: .bold, design: .default))
                Text("Return by \(returnTime).")
                    .foregroundStyle(.white)
                    .font(.system(size: widthUnit * 55, weight: .bold, design: .default))
                Text("SUTD Standard Time.")
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.system(size: widthUnit * 55, weight: .light, design: .default))
                Spacer()
            }
            .padding(widthUnit * 95)
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(Color("SwiftUIAcademy.Gray"))
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
        .background(.black)
    }
}

#Preview {
    LunchView(returnTime: "1pm")
}
