//
//  FoundationPile.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class FoundationPile: Pile {
    
    private let suit: Suit
    
    public init(_ suit: Suit) {
        self.suit = suit
        
        super.init()
    }
    
    public override func add(card: Card) {
        
        guard card.suit == self.suit else { return }
        
        if let topCard {
            
            guard card.rank == topCard.rank.next else { return }
            
            super.add(card: card)
            
        } else {
            
            guard card.rank == .ace else { return }
            
            super.add(card: card)
            
        }
    }
}
