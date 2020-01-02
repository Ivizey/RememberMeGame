//
//  Card.swift
//  RememberMeGame
//
//  Created by Pavel Bondar on 02.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier: Int = getUniqueIdentifier()) {
        self.identifier = identifier
    }
}
