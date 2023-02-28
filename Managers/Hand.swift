//
//  Hand.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Hand: ObservableObject {
    
    @Published public var cards: [Card]
    
    public init() {
        
        self.cards = []
        
        self.reset()
        
    }
    
    public func reset() {
        
        self.cards = []
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
        
        self.shuffle()
    }
    
    public func isEmpty() -> Bool {
        return self.cards.isEmpty
    }
    
    public func dealCard() -> Card? {
        return self.cards.popLast()
    }
    
    public func shuffle() {
        self.cards.shuffle()
    }
    
    public static var instance = Hand()
}
