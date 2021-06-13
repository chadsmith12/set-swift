//
//  CardShadingModifier.swift
//  Set
//
//  Created by Chad Smith on 6/12/21.
//

import SwiftUI

struct CardShadingModifier: ViewModifier {
    var shadingType: CardShading
    
    func body(content: Content) -> some View {
        Group {
            switch shadingType {
            case .solid:
                content
            case .transparent:
                content.opacity(0.2)
            case .outlined:
                ZStack {
                    content.opacity(0)
                    Color.clear.mask(content)
                }
            }
        }
    }
}

extension View {
    func shading(_ shadingType: CardShading) -> some View {
        self.modifier(CardShadingModifier(shadingType: shadingType))
    }
}
