//
//  FruitEmojiPresentationDashboardItem.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 8/9/23.
//

import SwiftUI

struct FruitEmojiPresentationDashboardItem: View {
    
    @Binding var state: PresentationState
    
    let groups = [
        "🍉 Watermelon",
        "🥭 Mango",
        "🍓 Strawberry",
        "🥥 Coconut",
        "🍊 Orange",
        "🍍 Pineapple",
        "🍇 Grapes",
        "🍋 Lemon",
        "🥝 Kiwi"
    ]
    
    @State private var selectedGroup = "🍉 Watermelon"
    
    var body: some View {
        DashboardElement(icon: {
            Image(systemName: "carrot.fill")
                .foregroundStyle(.green)
        }, title: "Fruit Emoji Display") {
            Picker("Group", selection: $selectedGroup) {
                ForEach(groups, id: \.self) { group in
                    Text(group)
                }
            }
            Spacer()
            Button("Connect to Display") {
                withAnimation {
                    state = .fruitEmoji(String(selectedGroup.first!))
                }
            }
            .keyboardShortcut(KeyboardShortcut("2", modifiers: .command))
        }
    }
}
