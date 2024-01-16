//
//  Model.swift
//  MyMemorize
//
//  Created by Maja on 12/01/2024.
//

import Foundation

struct MemorizeGameModel {
    var emojis = ["🥦", "🌽", "🥕", "🫛"]
    var cards: [Card] = []
    
    init() {
        cards.reserveCapacity(8)
        for index in 0..<4 {
            cards.append(Card(id: 2 * index, emoji: emojis[index]))
            cards.append(Card(id: 2 * index + 1, emoji: emojis[index]))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: Int
        let emoji: String
        var isFaceUp = true
        var isMatched = false
    }
    
    mutating func toggle(card: Card) {
        let index = cards.firstIndex { tappedCard in
            tappedCard.id == card.id
        }
        if let index {
            cards[index].isFaceUp.toggle()
        }
    }
}
