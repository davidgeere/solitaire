//
//  Int.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

extension Int {
    func words() -> String {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .spellOut
        
        if let result = formatter.string(from: NSNumber(value: self)) {
            return result
        }
        
        return String(self)
    }
}
