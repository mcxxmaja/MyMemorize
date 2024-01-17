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
    var firstUncoverendCardIndex: Int?
    
    init() {
        cards.reserveCapacity(8)
        for index in 0..<4 {
            cards.append(Card(id: 2 * index, emoji: emojis[index]))
            cards.append(Card(id: 2 * index + 1, emoji: emojis[index]))
        }
        cards.shuffle()
    }
    
    mutating func tapped(tappedCard: Card) {
        //check matching
        if firstUncoverendCardIndex == nil { // odkrycie pierwszej
            firstUncoverendCardIndex = findCardIndex(card: tappedCard)
            coverAll()
            toggle(card: tappedCard)
        } else { // odkrycie drugiej
            toggle(card: tappedCard)
            if cards[firstUncoverendCardIndex!].emoji == tappedCard.emoji {
                cards[firstUncoverendCardIndex!].isMatched = true
                cards[findCardIndex(card: tappedCard)!].isMatched = true
            }
            firstUncoverendCardIndex = nil
        }
    }
    
    mutating func coverAll() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    mutating func toggle(card: Card) {
        if let index = findCardIndex(card: card) {
            cards[index].isFaceUp.toggle()
        }
    }
    
    func findCardIndex(card: Card) -> Int? {
        let index = cards.firstIndex { cardIt in
            card.id == cardIt.id
        }
        return index
    }
    
    struct Card: Identifiable{
        var id: Int
        let emoji: String
        var isFaceUp = false
        var isMatched = false
    }
}
