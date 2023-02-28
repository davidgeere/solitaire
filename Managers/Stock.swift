//
//  Stock.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Stock: ObservableObject {
    
    @Published var pile: StockPile
    
    public init() {
        self.pile = StockPile()
    }
    
    public func clear() {
        
        self.pile.clear()
        
    }
    
    public func waste() -> Card? {
        return self.pile.cards.popLast()
    }
    
    public func refresh() {
        self.objectWillChange.send()
    }
    
    public static var instance = Stock()
}
