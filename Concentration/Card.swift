//
//  Card.swift
//  Concentration
//
//  Created by Aline Escobar on 13/09/20.
//  Copyright © 2020 Aline Escobar. All rights reserved.
//

import Foundation

struct Card  {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    
    }
    init(identifier: Int) {
        self.identifier = Card.getUniqueIdentifier()
    }
}
