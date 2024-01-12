//
//  ModelView.swift
//  MyMemorize
//
//  Created by Maja on 12/01/2024.
//

import Foundation

struct ViewModel {
    var model = MemorizeGameModel()
    
    func getCards() -> [MemorizeGameModel.Card] {
        model.cards
    }
}
