//
//  Waste.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Waste: ObservableObject {
    
    @Published var pile: WastePile
    
    public init() {
        self.pile = WastePile()
    }
    
    public func clear() {
        
        self.pile.clear()
        
    }
    
    public func refresh() {
        self.objectWillChange.send()
    }
    
    public static var instance = Waste()
}
