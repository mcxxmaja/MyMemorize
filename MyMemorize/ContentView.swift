//
//  ContentView.swift
//  MyMemorize
//
//  Created by Maja on 11/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var model: MemorizeGameModel = MemorizeGameModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(model.cards) { card in
                    CardView(card: card)
                        .aspectRatio(1, contentMode: .fill)
                        .onTapGesture {
                            model.toggle(card: card)
                        }
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: MemorizeGameModel.Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
            card.isFaceUp ? Text(card.emoji).font(.custom("gigant", size: 50)) : Text("")
        }
    }
}

#Preview {
    ContentView()
}
