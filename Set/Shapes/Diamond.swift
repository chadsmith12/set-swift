//
//  Diamond.swift
//  Set
//
//  Created by Chad Smith on 6/10/21.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct DiamondShape_Preview: PreviewProvider {
    static var previews: some View {
        Diamond()
            .frame(width: 100)
            .aspectRatio(1, contentMode: .fit)
            .foregroundColor(.blue)
        
    }
}
