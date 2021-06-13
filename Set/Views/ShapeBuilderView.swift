//
//  ShapeBuilderView.swift
//  Set
//
//  Created by Chad Smith on 6/12/21.
//

import SwiftUI

struct ShapeBuilderView: View {
    var cardData: SetGame.CardData
    
    struct FigureShapeView: Shape {
        var shape: CardShape
        
        func path(in rect: CGRect) -> Path {
            switch shape {
            case .diamond:
                return Diamond().path(in: rect)
            case .oval:
                return Circle().path(in: rect)
            case .rectangle:
                return Rectangle().path(in: rect)
            }
        }
    }
    
    private var figure: FigureShapeView {
        return FigureShapeView(shape: cardData.shape)
    }
    
    private var color: Color  {
        switch cardData.color {
            case .green: return Color.green
            case .purble: return  Color.purple
            case .red: return Color.red
        }
    }
    
    var body: some View {
        figure
            .frame(minWidth: 12, minHeight: 12)
            .shading(cardData.shading)
            .overlay(figure.stroke(lineWidth: 3))
            .foregroundColor(color)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct ShapeBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBuilderView(cardData: SetGame.CardData(shape: .diamond, color: .green, number: .one, shading: .outlined))
        ShapeBuilderView(cardData: SetGame.CardData(shape: .oval, color: .green, number: .one, shading: .outlined))
        ShapeBuilderView(cardData: SetGame.CardData(shape: .rectangle, color: .green, number: .one, shading: .outlined))
    }
}
