//
//  BackCardView.swift
//  Set
//
//  Created by Chad Smith on 6/12/21.
//

import SwiftUI

struct BackCardView: View {
    var body: some View {
        Image(systemName: "flame.fill")
            .resizable()
            .aspectRatio(2/3, contentMode: .fit)
            .padding()
            .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2)
            .foregroundColor(Color(.systemRed))
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.7)
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView()
    }
}
