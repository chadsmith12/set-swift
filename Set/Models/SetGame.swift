//
//  SetGame.swift
//  Set
//
//  Created by Chad Smith on 6/8/21.
//

import Foundation

struct SetGame {
    private(set) var cards: [Card]
    private(set) var cardsInGame: [Card]
    private(set) var discardedCards: [Card]
    private var selectedCards: [Card] {
        cardsInGame.filter() { card in
            card.isSelected
        }
    }
    
    init(cards: [Card]) {
        self.cards = cards.shuffled()
        self.cardsInGame = []
        self.discardedCards = []
    }
    
    mutating func dealCards(_ quantity: Int = 3) {
        let newCards = cards.prefix(quantity)
        cardsInGame += newCards
        cards = Array(cards.dropFirst(quantity))
    }
    
    mutating func choose(card: SetGame.Card) {
        for index in cardsInGame.indices {
            if cardsInGame[index] == card {
                cardsInGame[index].isSelected.toggle()
            }
        }
        
        checkForSet()
    }
    
    mutating func checkForSet() {
        if selectedCards.count != 3 {
            return
        }
        
        if Card.isSet(card1: selectedCards[0], card2: selectedCards[1], card3: selectedCards[2]) {
            print("we found a set!")
            discardCards()
            dealCards()
        }
        else {
            unselectCards()
        }
    }
    
    private mutating func discardCards() {
        for _ in selectedCards.indices {
            if let selectedIndex = cardsInGame.firstIndex(of: selectedCards.first!) {
                cardsInGame[selectedIndex].isMatched = true
                let cardToRemove = cardsInGame.remove(at: selectedIndex)
                discardedCards.append(cardToRemove)
            }
        }
    }
    
    private mutating func unselectCards() {
        for index in cardsInGame.indices {
            if selectedCards.contains(cardsInGame[index]) {
                cardsInGame[index].isSelected = false
            }
        }
    }
    
    struct Card: Identifiable, Equatable {
        static func == (lhs: SetGame.Card, rhs: SetGame.Card) -> Bool {
            lhs.id == rhs.id
        }
        
        var isSelected: Bool
        var isMatched: Bool
        var cardData: CardData
        var id: Int
        
        static func isSet(card1: Card, card2: Card, card3: Card) -> Bool {
            let featureCheck = [
                isNumberSet(card1: card1, card2: card2, card3: card3),
                isColorSet(card1: card1, card2: card2, card3: card3),
                isShapeSet(card1: card1, card2: card2, card3: card3),
                isShadingSet(card1: card1, card2: card2, card3: card3)
            ]
            
            return featureCheck.reduce(true) {
                $0 && $1
            }
        }
        
        private static func isNumberSet(card1: Card, card2: Card, card3: Card) -> Bool {
            if card1.cardData.number == card2.cardData.number && card2.cardData.number == card3.cardData.number {
                return true
            }
            
            if  card1.cardData.number != card2.cardData.number && card2.cardData.number != card3.cardData.number && card3.cardData.number != card1.cardData.number {
                return true
            }
            
            return false
        }
        
        private static func isColorSet(card1: Card, card2: Card, card3: Card) -> Bool {
            if card1.cardData.color == card2.cardData.color && card2.cardData.color == card3.cardData.color {
                return true
            }
            
            if  card1.cardData.color != card2.cardData.color && card2.cardData.color != card3.cardData.color && card3.cardData.color != card1.cardData.color {
                return true
            }
            
            return false
        }
        
        private static func isShapeSet(card1: Card, card2: Card, card3: Card) -> Bool {
            if card1.cardData.shape == card2.cardData.shape && card2.cardData.shape == card3.cardData.shape {
                return true
            }
            
            if  card1.cardData.shape != card2.cardData.shape && card2.cardData.shape != card3.cardData.shape && card3.cardData.shape != card1.cardData.shape {
                return true
            }
            
            return false
        }
        
        private static func isShadingSet(card1: Card, card2: Card, card3: Card) -> Bool {
            if card1.cardData.shading == card2.cardData.shading && card2.cardData.shading == card3.cardData.shading {
                return true
            }
            
            if  card1.cardData.shading != card2.cardData.shading && card2.cardData.shading != card3.cardData.shading && card3.cardData.shading != card1.cardData.shading {
                return true
            }
            
            return false
        }
    }
    
    struct CardData {
        var shape: CardShape
        var color: CardColor
        var number: CardNumber
        var shading: CardShading
    }   
}
