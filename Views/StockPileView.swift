//
//  StockPileView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct StockPileView: View {
    
    @EnvironmentObject var game: Game
    @EnvironmentObject var stock: Stock
    
    var ns: Namespace.ID
    
    var body: some View {
        
        ZStack{
            
            VectorView("depot/reload")
                .foregroundColor(.white.opacity(0.4))
                .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                .frame(maxWidth: .infinity)
                .onTapGesture {
//                    while var card = manager.waste.pile.popLast() {
//
//                        card.facing = .down
//
//                        manager.stock.pile.append(card)
//
//                        manager.refresh()
//                    }
                }
            
            ForEach($stock.pile.cards) { item in
                
                CardView(card: item, in: ns)
                    .onTap { view in
                        withAnimation(.spring()) {
                            self.game.moveFromStockToWaste()
                        }
                    }
            }
        }
    }
}

struct StockPileView_Previews: PreviewProvider {
    
    @Namespace static private var pile
    
    static var previews: some View {
        StockPileView(ns: pile)
            .environmentObject(Game.instance)
            .environmentObject(Stock.instance)
    }
}
