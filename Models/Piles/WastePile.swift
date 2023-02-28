//
//  WastePile.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class WastePile: Pile {
    
    public override func add(card: Card) {
        
        super.add(card: card)
        
        if var added = self.cards.first(where: { return $0.id == card.id }) {
            added.facing = .up
        }
    }
    
}
