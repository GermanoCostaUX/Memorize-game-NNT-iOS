//
//  MemoryGame.swift
//  Memorize
//
//  Created by user217597 on 8/24/22.
//

// Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card> // can see but can` t touch it
    
    private var indexOftheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly}
        set {cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}
    }
}
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card) {
        // if let chosenIndex = cards.firstIndex(where: { aCardInTheCardsArray in aCardInTheCardsArray.id == card.id }) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOftheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                //for index in 0..<cards.count {
                indexOftheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    /*
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
     */
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [] // Array<Card>() // creating amn empty array of cards
        // add numberOfPairOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent // don`t care the type - generics
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return first
        } else {
            return nil
        }
    }
}
