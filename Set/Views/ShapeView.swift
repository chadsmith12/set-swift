//
//  ShapeView.swift
//  Set
//
//  Created by Chad Smith on 6/11/21.
//

import SwiftUI

struct ShapeView: View {
    let card: SetGame.Card
    var numberShapes: Int {
        switch card.cardData.number {
            case .one: return 1
            case .two: return 2
            case .three: return 3
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< numberShapes) { number in
                ShapeBuilderView(cardData: card.cardData)
            }
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(card: SetGame.Card(isSelected: true, isMatched: true, cardData: SetGame.CardData(shape: .oval, color: .purble, number: .three, shading: .outlined), id: 1))
    }
}
