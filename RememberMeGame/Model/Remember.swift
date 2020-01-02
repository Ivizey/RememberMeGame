//
//  Remember.swift
//  RememberMeGame
//
//  Created by Pavel Bondar on 02.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

class Remember {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsCards: Int) {
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // If no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
