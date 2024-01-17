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
        if let uncoveredBeforeIndex = firstUncoverendCardIndex {
            if cards[uncoveredBeforeIndex].emoji == tappedCard.emoji {
                markMatched(at: uncoveredBeforeIndex)
                markMatched(card: tappedCard)
            }
            firstUncoverendCardIndex = nil
            
        } else {
            coverAll()
            firstUncoverendCardIndex = findCardIndex(card: tappedCard)
        }
        toggle(card: tappedCard)
    }
    
    mutating func markMatched(card: Card) {
        if let index = findCardIndex(card: card) {
            cards[index].isMatched = false
            cards[index].isMatched = true
        }
    }
    
    mutating func markMatched(at index: Int) {
        cards[index].isMatched = true
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
