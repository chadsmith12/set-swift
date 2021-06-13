//
//  ContentView.swift
//  Set
//
//  Created by Chad Smith on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cardsInGame, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .onTapGesture {
                        game.choose(card: card)
                    }
            }
            Spacer()
            Button("Add Cards") {
                game.dealCards()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: SetGameViewModel())
    }
}
