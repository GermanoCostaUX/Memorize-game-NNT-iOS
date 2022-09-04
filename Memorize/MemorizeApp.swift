//
//  MemorizeApp.swift
//  Memorize
//
//  Created by user217597 on 8/21/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // creating a EmojiMemoryGame
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game) // it sets the variable in ContentView
        }
    }
}
