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
                            model.tapped(tappedCard: card)
                        }
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: MemorizeGameModel.Card
    let cardShape = RoundedRectangle(cornerRadius: 50)
    
    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                cardShape
                Text(card.emoji).font(.custom("gigant", size: 50))
            } else {
                cardShape.foregroundColor(.blue)
            }
        }
        .padding(5)
    }
}


#Preview {
    ContentView()
}
