//
//  TableauPile.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class TableauPile : Pile {
    private let column: Column
    
    public init(_ column: Column) {
        self.column = column
        
        super.init()
    }
    
    public override func add(card: Card) {
        
        if let topCard {
            
            guard card.suit.pair != topCard.suit.pair else { return }
            
            guard card.rank == topCard.rank.previous else { return }
            
            super.add(card: card)
            
        } else {
            
            guard card.rank == .king else { return }
            
            super.add(card: card)
            
        }
    }
}
