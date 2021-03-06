//
//  Concentration.swift
//  Concentration
//
//  Created by Aline Escobar on 13/09/20.
//  Copyright © 2020 Aline Escobar. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            return cards.indices.filter{ cards[$0].isFacedUp }.oneAndOnly
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): chosen index not in the range.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards.")
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
