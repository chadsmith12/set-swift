//
//  SetGameViewModel.swift
//  Set
//
//  Created by Chad Smith on 6/13/21.
//

import Foundation

class SetGameViewModel: ObservableObject {
    private static func generateAllCards() -> [SetGame.Card] {
        var cards = [SetGame.Card]()
        var id = 1
        
        for number in CardNumber.allCases {
            for shape in CardShape.allCases {
                for color in CardColor.allCases {
                    for shading in CardShading.allCases {
                        cards.append(SetGame.Card(isSelected: false, isMatched: false, cardData: SetGame.CardData(shape: shape, color: color, number: number, shading: shading), id: id))
                        id += 1
                    }
                }
            }
        }
        
        return cards
    }
    
    @Published private var game: SetGame
    
    init() {
        game = SetGame(cards: SetGameViewModel.generateAllCards())
        game.dealCards(12)
    }
    
    var cardsInGame: [SetGame.Card] {
        game.cardsInGame
    }
    
    func choose(card: SetGame.Card) {
        game.choose(card: card)
    }
    
    func dealCards() {
        game.dealCards()
    }
}
