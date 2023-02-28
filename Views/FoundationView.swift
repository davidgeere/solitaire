//
//  FoundationView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct FoundationView: View {
    
    @EnvironmentObject public var game: Game
    @EnvironmentObject public var foundation: Foundation
    
    private var table: Namespace.ID
    
    public init(on table: Namespace.ID) {
        self.table = table
    }
    
    var body: some View {
        FoundationPileView(.diamonds, on: table)
        FoundationPileView(.spades, on: table)
        FoundationPileView(.hearts, on: table)
        FoundationPileView(.clubs, on: table)
    }
    
}

struct FoundationView_Previews: PreviewProvider {
    
    @Namespace static private var table
    
    static var previews: some View {
        FoundationView(on: table)
            .environmentObject(Game.instance)
            .environmentObject(Foundation.instance)
    }
}
