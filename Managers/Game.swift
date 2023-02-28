//
//  Hand.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Game: ObservableObject {
    
    public var hand: Hand
    public var stock: Stock
    public var waste: Waste
    public var foundation: Foundation
    public var tableau: Tableau
    
    public init(stock: Stock, waste: Waste, foundation: Foundation, tableau: Tableau) {
        
        self.hand = Hand()
        
        self.stock = stock
        self.waste = waste
        self.foundation = foundation
        self.tableau = tableau
        
    }
    
    public func clear() {
        
        self.tableau.clear()
        self.stock.clear()
        self.waste.clear()
        self.foundation.clear()
        
    }
    
    public func deal() {
        
        guard !self.hand.isEmpty() else { return }
        
        self.clear()
        
        self.dealToTableau()
        self.dealToStock()
        
    }
    
    public func dealToTableau() {
        
        for column in Column.allCases {
            for i in 1...column.value {
                
                guard var card = self.hand.dealCard() else { continue }
                
                if i == column.value {
                    card.facing = .up
                }
                
                self.tableau[column].add(card: card)
            }
        }
        
    }
    
    public func dealToStock() {
        
        while var card = self.hand.dealCard() {
            self.stock.pile.add(card: card)
        }
        
    }
    
    public func moveFromStockToWaste() {
        
        if var wasted = self.stock.waste() {
            
            self.waste.pile.add(card: wasted)
            
        }
    }
    
    public func moveFromWasteToStock() {
        
    }
    
    public func move(from: Waste, to: Foundation) {
        
    }
    
    public func move(from: Waste, to: Tableau) {
        
    }
    
    public func moveCardToStock(card: Card) {
        self.stock.pile.add(card: card)
    }
    
    public func refresh() {
        self.objectWillChange.send()
    }
    
    public static var instance = Game(stock: Stock.instance, waste: Waste.instance, foundation: Foundation.instance, tableau: Tableau.instance)
}
