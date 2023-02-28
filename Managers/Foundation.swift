//
//  Foundation.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Foundation: ObservableObject {
    @Published var hearts: FoundationPile
    @Published var spades: FoundationPile
    @Published var clubs: FoundationPile
    @Published var diamonds: FoundationPile
    
    public init() {
        self.hearts = FoundationPile(.hearts)
        self.spades = FoundationPile(.spades)
        self.clubs = FoundationPile(.clubs)
        self.diamonds = FoundationPile(.diamonds)
    }
    
    public func clear() {
        
        self.hearts.clear()
        self.spades.clear()
        self.clubs.clear()
        self.diamonds.clear()
        
    }
    
        
    
    subscript(suit: Suit) -> FoundationPile {
        get {
            switch suit {
            case .hearts: return self.hearts
            case .spades: return self.spades
            case .clubs: return self.clubs
            case .diamonds: return self.diamonds
            }
        }
        
        set {
            switch suit {
            case .hearts: self.hearts = newValue
            case .spades: self.spades = newValue
            case .clubs: self.clubs = newValue
            case .diamonds: self.diamonds = newValue
            }
        }
    }
    
    public func refresh() {
        self.objectWillChange.send()
    }
    
    public static var instance = Foundation()
}
