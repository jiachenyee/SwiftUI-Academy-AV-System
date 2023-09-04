//
//  DashboardSection.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 5/9/23.
//

import Foundation
import SwiftUI

struct DashboardSection<Content: View>: View {
    
    var systemName: String
    var title: String
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
            Text(title)
        }
        .font(.title2)
        .fontWeight(.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 400), spacing: 16)], spacing: 16) {
            content()
        }
        .padding(.top, 8)
        Divider()
            .padding(.vertical, 8)
    }
}

#Preview {
    DashboardSection(systemName: "pc", title: "test") {
    }
}
