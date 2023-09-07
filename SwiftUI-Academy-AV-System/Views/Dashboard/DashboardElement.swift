//
//  DashboardElement.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

struct DashboardElement<Content: View, IconImage: View>: View {
    
    @ViewBuilder
    var icon: () -> IconImage
    var title: String
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                icon()
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Divider()
                .padding(.vertical, 4)
            
            content()
        }
#if os(macOS)
        .frame(height: 200, alignment: .top)
#else
        .frame(height: 300, alignment: .top)
#endif
        .padding()
        .background(.white.opacity(0.1))
        .cornerRadius(8)
    }
}
