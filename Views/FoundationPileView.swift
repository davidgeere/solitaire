//
//  FoundationPileView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct FoundationPileView: View {
    
    @EnvironmentObject public var game: Game
    @EnvironmentObject public var foundation: Foundation
    
    var suit: Suit
    
    var table: Namespace.ID
    
    public init(_ suit: Suit, on table: Namespace.ID) {
        
        self.suit = suit
        self.table = table
        
    }
    
    var body: some View {
        ZStack( alignment: .topLeading) {
            
            VectorView("depot/\(suit.name)")
                .foregroundColor(.white.opacity(0.4))
                .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            ForEach($foundation[suit].cards) { card in
                
                CardView(card: card, in: table)
                    .onTap { view in
                        
                        withAnimation(.spring()) {
                            
//                            switch item.rank {
//                            case .king: // if it's a king place it in an empty tableau
//
//                                if var column = game.tableau.open {
//
//                                    game.foundation[suit].removeAll(where: {  return $0.id == item.id })
//
//                                    game.tableau[column].append(item)
//
//                                    game.refresh()
//
//                                    return
//
//                                }
//
//                            default: // anything else, see where there is a match and move it there
//
//                                for column in Column.allCases {
//
//                                    guard let last = game.tableau[column].last, last.rank == item.rank.next, last.suit.pair != item.suit.pair else { continue }
//
//                                    game.foundation[suit].removeAll(where: {  return $0.id == item.id })
//
//                                    game.tableau[column].append(item)
//
//                                    game.refresh()
//
//                                    return
//                                }
//                            }
                        }
                        
                        withAnimation(.easeIn(duration: 0.1)) {
                            view.numberOfShakes = 10
                        }
                        
                        view.numberOfShakes = 0
                    }
                //                .rotation3DEffect(item.facing == .up ? .degrees(180): .zero, axis: (x: .zero, y: 1, z: .zero))
                //                .matchedGeometryEffect(id: item.id, in: ns, isSource: manager.selectedItem != item)
            }
        }
    }
}

struct FoundationPileView_Previews: PreviewProvider {
    
    @Namespace static private var table
    
    static var previews: some View {
        FoundationPileView(.diamonds, on: table)
            .environmentObject(Game.instance)
            .environmentObject(Foundation.instance)
    }
}
