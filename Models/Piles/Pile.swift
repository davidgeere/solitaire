//
//  Pile.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Pile {
    
    public var cards: [Card]
    
    internal init() {
        self.cards = []
    }
    
    public var visibleCards: [Card] {
        return self.cards.filter( { return $0.facing == .up } )
    }
    
    public var isEmpty: Bool {
        return self.cards.isEmpty
    }
    
    public var topCard: Card? {
        return self.cards.last
    }
    
    public func add(card: Card) {
        self.cards.append(card)
    }
    
    public func remove(card: Card) {
        if let index = self.cards.firstIndex(of: card) {
            self.cards.remove(at: index)
        }
    }
    
    public func clear() {
        self.cards.removeAll()
    }
    
}
