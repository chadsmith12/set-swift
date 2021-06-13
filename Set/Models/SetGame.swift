//
//  SetGame.swift
//  Set
//
//  Created by Chad Smith on 6/8/21.
//

import Foundation

struct SetGame {
    var cards: [Card]
    
    struct Card: Identifiable {
        var isSelected: Bool
        var isMatched: Bool
        var cardData: CardData
        var id: UUID = UUID()
    }
    
    struct CardData {
        var shape: CardShape
        var color: CardColor
        var number: CardNumber
        var shading: CardShading
        
        func isSolidDiamond() -> Bool {
            self.shape == .diamond && self.shading ==  .solid
        }
        
        func isTransparentDiamond() -> Bool {
            self.shape == .diamond && self.shading == .transparent
        }
        
        func isOutlinedDiamond() -> Bool {
            self.shape == .diamond && self.shading == .outlined
        }
        
        func isSolidOval()  -> Bool {
            self.shape == .oval && self.shading ==  .solid
        }
        
        func isTransparentOval() -> Bool {
            self.shape == .oval && self.shading == .transparent
        }
        
        func isOutlinedOval() -> Bool {
            self.shape == .oval && self.shading == .outlined
        }
        
        func isSolidRectangle()  -> Bool {
            self.shape == .rectangle && self.shading ==  .solid
        }
        
        func isTransparentRectangle() -> Bool {
            self.shape == .rectangle && self.shading == .transparent
        }
        
        func isOutlinedRectangle() -> Bool {
            self.shape == .rectangle && self.shading == .outlined
        }
    }   
}
