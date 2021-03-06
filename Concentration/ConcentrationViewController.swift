//
//  ViewController.swift
//  Concentration
//
//  Created by Aline Escobar on 09/09/20.
//  Copyright © 2020 Aline Escobar. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    @IBAction func newGameButton(_ sender: Any) {
        initiateGame()
    }
    
    @IBOutlet weak var newGame: UIButton!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private(set) var scoreCount: Int = 0 {
        didSet {
//            updateScoreLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attribuitedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attribuitedString
    }
    
//    private func updateScoreLabel() {
//        let attriebutes: [NSAttributedString.Key: Any] = [
//            .strokeWidth: 5.0,
//            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        ]
//        let attribuitedString = NSAttributedString(string: "Score: \(scoreCount)", attributes: attributes)
//        scoreLabel.attributedText = attribuitedString
//    }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private weak var scoreLabel: UILabel! {
        didSet {
//            updateScoreLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.firstIndex(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromTheModel()
    }
    
    func updateViewFromTheModel() {
        if cardButtons != nil{
            for index in cardButtons.indices{
                let button = cardButtons[index]
                let card = game.cards[index]
                
                if card.isFacedUp {
                    button.setTitle(emoji (for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    
                    if card.isMatched {
                        scoreCount+=1
                    }
                    
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            defaultEmojis = theme ?? " "
            emoji = [:]
            updateViewFromTheModel()
        }
    }
    
    var animalsEmojis = "🐈🐓🐕🐋🐞🦋🦚🦥"
    var electronicEmojis = "💻📱🎮📷📡🎧💾📼"
    var flagEmojis = "🇧🇷🇩🇪🇫🇷🇳🇬🇮🇹🇦🇴🇵🇭🇲🇾"
    var foodEmoji = "🍣🍔🥨☕🍺🍩🍱🍕"
    var halloweenEmojis = "🕸️🕷️👻🎃☠️🧛🏽🦇🧙🏾"
    var natureEmojis = "🌴🌸🍁☀️🌑🌈🌧️🌿"
    var sportsEmojis = "🏀⚽🏊🏾🎾🏉⚾🏄🏾‍♀️🚴🏾‍♀️"
    
//    lazy var themes = [animalsEmojis, halloweenEmojis, sportsEmojis, natureEmojis, flagEmojis, electronicEmojis, foodEmoji]
    
    private var defaultEmojis = "🕸️🕷️👻🎃☠️🧛🏽🦇🧙🏾"
    private var emojiChoices = "❤️🧡🧡💛💚💙💜🖤"
    
    @IBOutlet var themeButtons: [UIButton]!
    
    @IBAction func selecTheme(_ sender: UIButton) {
//        let theme = themeButtons.firstIndex(of: sender)!
//        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
//        defaultEmojis = themes[theme]
//        scoreCount = 0
//        updateViewFromTheModel()
    }
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, defaultEmojis.count > 0 {
            let randomStringIndex = defaultEmojis.index(defaultEmojis.startIndex, offsetBy: defaultEmojis.count.arc4random)
            emoji[card] = String(defaultEmojis.remove(at: randomStringIndex))
        }
            return emoji[card] ?? "?"
    }
    
    func initiateGame() {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
//        defaultEmojis = halloweenEmojis
        scoreCount = 0
        updateViewFromTheModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateGame()
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
