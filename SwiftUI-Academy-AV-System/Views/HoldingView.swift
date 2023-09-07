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
    
    @State private var date = Date.now
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                HStack {
                    Text("Singapore Time:")
                        .foregroundStyle(.white)
                        .font(.system(size: widthUnit * 55, weight: .medium, design: .default))
                    Text(date, style: .time)
                        .foregroundStyle(Color("SwiftUIAcademy"))
                        .font(.system(size: widthUnit * 55, weight: .medium, design: .default))
                }
                Text(try! AttributedString(markdown: title))
                    .foregroundStyle(Color("SwiftUIAcademy"))
                    .font(.system(size: widthUnit * 116, weight: .bold, design: .default))
                Text(try! AttributedString(markdown: subtitle))
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
        .onReceive(timer) { _ in
            date = .now
        }
    }
}

#Preview {
    HoldingView(title: "Wait a bit.", subtitle: "Do XYZ.")
}
