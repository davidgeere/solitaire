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
    
    public init(hand: Hand, stock: Stock, waste: Waste, foundation: Foundation, tableau: Tableau) {
        
        self.hand = hand
        
        self.stock = stock
        self.waste = waste
        self.foundation = foundation
        self.tableau = tableau
        
    }
    
    public func clear() {
        
        self.hand.reset()
        
        self.tableau.clear()
        self.stock.clear()
        self.waste.clear()
        self.foundation.clear()
        
    }
    
    public func deal() {
        
        guard !self.hand.isEmpty() else { return }
        
        self.clear()
        
        var column = Column.one
        
        print("hand", self.hand.cards.count, "tableau:", self.tableau.count, "stock", self.stock.pile.cards.count)
        
//        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
        while var card = self.hand.dealCard() {

//                guard var card = self.hand.dealCard() else { return timer.invalidate() }
                
                if self.tableau.count < 28 {

                    while self.tableau[column].cards.count > column.value {
                        column = column.next
                    }
                    
                    if self.tableau[column].cards.count == column.value {
                        card.facing = .up
                    }
                    
                    print("\(column):", self.tableau[column].cards.count, column.value)
                    
                    self.tableau.add(card, to: column)
                    
                    self.refresh()
                    
                    column = column.next
                    
                } else {
                    
                    self.stock.add(card)
                    
                    self.refresh()
                    
                }
            
            print("hand", self.hand.cards.count, "tableau:", self.tableau.count, "stock", self.stock.pile.cards.count)
        }
        
        self.refresh()
        
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
    
    public static var instance = Game(hand: Hand.instance, stock: Stock.instance, waste: Waste.instance, foundation: Foundation.instance, tableau: Tableau.instance)
}
