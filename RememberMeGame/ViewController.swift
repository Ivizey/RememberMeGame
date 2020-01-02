//
//  ViewController.swift
//  RememberMeGame
//
//  Created by Pavel Bondar on 25.12.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    lazy var game = Remember(numberOfPairsCards: (cardButtons.count) / 2)
    var emojiChoices = ["🍎", "🍉", "🍋", "🌮", "🍌", "🍅", "🌽", "🍇"]
    var emoji = [Int: String]()
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }

    @IBAction func touchCardButton(_ sender: UIButton) {
        flipsCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewfromModel()
        } else {
            print("Selected card is unknown")
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func updateViewfromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .black
            }
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .white
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .black
        }
    }
}

