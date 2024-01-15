//
//  ContentView.swift
//  MyMemorize
//
//  Created by Maja on 11/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var emojis = ["🥦", "🌽", "🥕", "🫛", "🥦", "🌽", "🥕", "🫛"]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(0..<8) { index in
                    CardView(id: index, emoji: emojis[index])
                }
                .aspectRatio(1, contentMode: .fill)
                .onTapGesture {
                    
                }
            }
        }
        .padding()
    }
    
    init() {
        emojis.shuffle()
    }
}

struct CardView: View, Identifiable {
    var id: Int
    let emoji: String
    var isFaceUp = true
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
