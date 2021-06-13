//
//  CardView.swift
//  Set
//
//  Created by Chad Smith on 6/9/21.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        ZStack {
            FrontCardView(card: card)
        }
        .padding(DrawingConsts.padding)
    }
    
    private struct DrawingConsts {
        static let padding: CGFloat = 5
    }
}

struct CardView_Previews: PreviewProvider {
    static let card =  SetGame.Card(isSelected: false, isMatched: false, cardData: SetGame.CardData(shape: .diamond, color: .red, number: .three, shading: .outlined))
    static var previews: some View {
        CardView(card: card)
        CardView(card: SetGame.Card(isSelected: true, isMatched: false, cardData: SetGame.CardData(shape: .oval, color: .green, number: .two, shading: .solid)))
    }
}
