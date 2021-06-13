//
//  FrontCardView.swift
//  Set
//
//  Created by Chad Smith on 6/12/21.
//

import SwiftUI

struct FrontCardView: View {
    let card: SetGame.Card
    private let cardShape = RoundedRectangle(cornerRadius: DrawingConsts.cornerRadius)
    private var selectedColor: Color {
        card.isSelected ? .green : .black
    }
    var body: some View {
        cardShape
            .fill(Color.white)
            .overlay(
                cardShape
                    .strokeBorder(lineWidth: DrawingConsts.lineWidth)
                    .foregroundColor(selectedColor)
                    .opacity(DrawingConsts.opacity)
            )
            .aspectRatio(DrawingConsts.aspectRatio, contentMode: .fit)
            
        ShapeView(card: card)
            .padding(DrawingConsts.shapePadding)
    }
    
    private struct DrawingConsts {
        static let lineWidth: CGFloat = 3
        static let cornerRadius: CGFloat = 20
        static let shapePadding: CGFloat = 10
        static let opacity = 0.8
        static let aspectRatio: CGFloat = 2/3
    }
}

struct FrontCardView_Previews: PreviewProvider {
    static let card =  SetGame.Card(isSelected: false, isMatched: false, cardData: SetGame.CardData(shape: .diamond, color: .red, number: .three, shading: .outlined))
    static var previews: some View {
        ZStack {
            FrontCardView(card: card)
        }
    }
}
