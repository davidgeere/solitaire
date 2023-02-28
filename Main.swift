//
//  Main.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

@main
struct Main: App {
    
    @StateObject public var game: Game
    
    @StateObject var hand: Hand
    @StateObject var stock: Stock
    @StateObject var waste: Waste
    @StateObject var foundation: Foundation
    @StateObject var tableau: Tableau
    
    public init() {
        
        let hand = Hand()
        let stock = Stock()
        let waste = Waste()
        let foundation = Foundation()
        let tableau = Tableau()
        
        let game = Game(hand: hand, stock: stock, waste: waste, foundation: foundation, tableau: tableau)
        
        self._hand = StateObject(wrappedValue: hand)
        self._stock = StateObject(wrappedValue: stock)
        self._waste = StateObject(wrappedValue: waste)
        self._foundation = StateObject(wrappedValue: foundation)
        self._tableau = StateObject(wrappedValue: tableau)
        
        self._game = StateObject(wrappedValue: game)
        
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(self.game)
                .environmentObject(self.hand)
                .environmentObject(self.stock)
                .environmentObject(self.tableau)
                .environmentObject(self.waste)
                .environmentObject(self.foundation)
        }
    }
}
