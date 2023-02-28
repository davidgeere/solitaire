//
//  Card.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

struct Card: Identifiable, Equatable {
    
    var id = UUID()
    
    var suit: Suit
    var rank: Rank
    var facing: Face
    
    init(suit: Suit, rank: Rank, face: Face = .down) {
        self.suit = suit
        self.rank = rank
        self.facing = face
    }
}
