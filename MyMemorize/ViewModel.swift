//
//  ModelView.swift
//  MyMemorize
//
//  Created by Maja on 12/01/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var model = MemorizeGameModel()
    
    func getCards() -> [MemorizeGameModel.Card] {
        model.cards
    }
    
    func tapped(tappedCard: MemorizeGameModel.Card) {
        model.tapped(tappedCard: tappedCard)
    }
}
