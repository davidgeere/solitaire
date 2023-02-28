//
//  MainView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct MainView: View {
    
    @Namespace private var table
    
    @EnvironmentObject var game: Game
    @EnvironmentObject var hand: Hand
    @EnvironmentObject var stock: Stock
    @EnvironmentObject var waste: Waste
    @EnvironmentObject var foundation: Foundation
    @EnvironmentObject var tableau: Tableau
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            VStack(spacing: ( GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.MARGIN / GLOBALS.CARD.WIDTH ))) {
                HStack(alignment: .top, spacing: ( GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.SPACING / GLOBALS.CARD.WIDTH ))) {
                    
                    StockPileView(ns: table)
                        .environmentObject(self.stock)
                    
                    WastePileView(ns: table)
                        .environmentObject(self.waste)
                    
                    BlankView()
                    
                    FoundationView(on: table)
                        .environmentObject(self.foundation)
                }
                
                TableauView(on: table)
                    .environmentObject(self.tableau)
                
//                Spacer()
                
                HStack(alignment: .top, spacing: ( GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.SPACING / GLOBALS.CARD.WIDTH ))) {
                    BlankView()
                    BlankView()
                    BlankView()
                    BlankView()
                    BlankView()
                    BlankView()
                    BlankView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack(alignment: .top, spacing: ( GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.SPACING / GLOBALS.CARD.WIDTH ))) {
                    BlankView()
                    BlankView()
                    BlankView()
                    ZStack{
                        ForEach(self.$hand.cards) { card in
                            CardView(card: card, in: table)
                        }
                    }
                    BlankView()
                    BlankView()
                    BlankView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding((GLOBALS.CARD.WIDTH/*Deck.instance.size.width*/ * ( GLOBALS.TABLE.MARGIN / GLOBALS.CARD.WIDTH )))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GLOBALS.TABLE.COLOR)
        .coordinateSpace(name: GLOBALS.TABLE.NAME)
        .onTapGesture {
            self.game.deal()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Game.instance)
            .environmentObject(Hand.instance)
            .environmentObject(Stock.instance)
            .environmentObject(Tableau.instance)
            .environmentObject(Waste.instance)
            .environmentObject(Foundation.instance)
    }
}
