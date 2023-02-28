//
//  TableauView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct TableauView: View {
    
    @EnvironmentObject public var tableau: Tableau
    
    private var table: Namespace.ID
    
    public init(on table: Namespace.ID) {
        self.table = table
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Spacer(minLength: 0)
            HStack(alignment: .top, spacing: ( GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.SPACING / GLOBALS.CARD.WIDTH )) ) {
                TableauPileView(.one, on: table)
                TableauPileView(.two, on: table)
                TableauPileView(.three, on: table)
                TableauPileView(.four, on: table)
                TableauPileView(.five, on: table)
                TableauPileView(.six, on: table)
                TableauPileView(.seven, on: table)
            }
        }
    }
}

struct TableauView_Previews: PreviewProvider {
    
    @Namespace static private var table
    
    static var previews: some View {
        TableauView(on: table)
            .environmentObject(Game.instance)
            .environmentObject(Tableau.instance)
    }
}
