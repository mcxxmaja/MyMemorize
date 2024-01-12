//
//  ContentView.swift
//  MyMemorize
//
//  Created by Maja on 11/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var emojis = ["🥦", "🌽", "🥕", "🫛"]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            cardView(emoji: emojis[0])
            cardView(emoji: emojis[0])
            cardView(emoji: emojis[0])
            cardView(emoji: emojis[0])
            cardView(emoji: emojis[1])
            cardView(emoji: emojis[1])
            cardView(emoji: emojis[2])
            cardView(emoji: emojis[2])
            cardView(emoji: emojis[3])
            cardView(emoji: emojis[3])
        }
        .padding()
    }
}

struct cardView: View {
    let emoji: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
            Text(emoji).font(.custom("gigant", size: 50))
        }
    }
}

#Preview {
    ContentView()
}
