//
//  Model.swift
//  MyMemorize
//
//  Created by Maja on 12/01/2024.
//

import Foundation

struct MemorizeGameModel {
    var cards: [Card] = []
    
    init() {
        cards.reserveCapacity(8)
        for _ in 0...3 {
            cards.append(Card(str: "temp"))
            cards.append(Card(str: "temp"))
        }
    }
    
    struct Card {
        let str: String
    }
}
