//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by user217597 on 8/21/22.
//

// View

import SwiftUI

struct EmojiMemoryGameView: View { // pass this everywhere we create a ContentView - MemorizeApp
    @ObservedObject var game: EmojiMemoryGame // it should be called "gameView" but we use "viewModel" to show us that we access the view models "some View" above


    var body: some View {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
//            ForEach(game.cards) {card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        })
//                }
//            }
//        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card

    
    var body: some View {
        GeometryReader  { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0) // transparent
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
        
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
    }
}
