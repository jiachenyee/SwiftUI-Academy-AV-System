//
//  HoldingView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import SwiftUI

struct HoldingView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text(title)
                    .foregroundStyle(Color("SwiftUIAcademy"))
                    .font(.system(size: widthUnit * 116, weight: .bold, design: .default))
                Text(subtitle)
                    .foregroundStyle(.white)
                    .font(.system(size: widthUnit * 55, weight: .bold, design: .default))
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
    HoldingView(title: "Wait a bit.", subtitle: "Do XYZ.")
}
