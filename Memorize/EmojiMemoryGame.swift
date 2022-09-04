//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by user217597 on 8/24/22.
//

// View Model

// ;

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // type variables
    typealias Card = MemoryGame<String>.Card
    static let emojis = ["🚲","🚀","🚜","⛵️","🚑","🚗","🛥","🛸","🛴","🛶","🚈","🛵","🚤","🚢","🚎","🛻","🛺","🏎","🚓","🚒","🚕","🚌","🛩","🚇"] // static makes it global and linked to the class EmojoMemoryGame
    // connection to the model
    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 15) { pairIndex in emojis[pairIndex]
        } /* private means only the view model code itself can view the model */
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}

struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
