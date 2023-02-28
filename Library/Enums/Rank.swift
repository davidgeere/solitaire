//
//  Rank.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

enum Rank: Int, CaseIterable, Identifiable, Codable {
    
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    
    var id: Int {
        return rawValue
    }
    
    var value: Int {
        return rawValue
    }
    
    var next: Rank? {
        return Rank(rawValue: self.rawValue + 1)
    }
    
    var previous: Rank? {
        return Rank(rawValue: self.rawValue - 1)
    }

    var symbol: String {
        switch self {
        case .ace: return "A"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ten: return "10"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        }
    }
    
    var name: String {
        
        switch self {
        case .ace: return "ace"
        case .two: return "two"
        case .three: return "three"
        case .four: return "four"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
        case .ten: return "ten"
        case .jack: return "jack"
        case .queen: return "queen"
        case .king: return "king"
        }
    }
    
    static var count: Int {
        return Rank.allCases.count
    }
}
