//
//  Face.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

enum Face {
    case up
    case down
    
    var name: String {
        switch self {
        case .up: return "up"
        case .down: return "down"
        }
    }
    
    public func toggle() -> Face {
        switch self {
        case .up: return .down
        case .down: return .up
        }
    }
}
