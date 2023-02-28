//
//  Column.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

enum Column: Int, CaseIterable, Codable, Identifiable {
    
    case one = 1, two, three, four, five, six, seven
    
    var id: Int {
        return self.rawValue
    }
    
    var value: Int {
        return self.rawValue
    }
    
    var count: Int {
        return self.value - 1
    }
    
    var order: Int {
        return self.rawValue * 100
    }
    
    var name: String {
        return self.value.words()
    }
    
    var next: Column {
        if self.rawValue + 1 <= 7 {
            return Column(rawValue: self.rawValue + 1)!
        } else {
            return Column(rawValue: 1)!
        }
    }
    
    var previous: Column {
        
        if self.rawValue - 1 >= 1 {
            return Column(rawValue: self.rawValue - 1)!
        } else {
            return Column(rawValue: 7)!
        }
        
    }
    
}
