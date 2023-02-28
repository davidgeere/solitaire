//
//  WastePileView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct WastePileView: View {
    
    @EnvironmentObject var manager: Game
    
    var ns: Namespace.ID
    
    var body: some View {
        
        ZStack{
            
            Color.clear // spacer
                .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            ForEach($manager.waste.pile.cards) { item in
                
                CardView(card: item, in: ns)
                    .onTap { view in
                        
                        withAnimation(.spring()) {
                            
//                            switch item.rank {
//                            case .ace: // if it's an ace, place it in the right foundation
//
//                                manager.waste.pile.removeAll(where: {  return $0.id == item.id })
//
//                                item.facing = .up
//
//                                manager.foundation[item.suit].append(item)
//
//                                manager.refresh()
//
//                                return
//
//                            case .king: // if it's a king place it in an empty tableau
//
//                                if var column = manager.tableau.open {
//
//                                    manager.waste.pile.removeAll(where: {  return $0.id == item.id })
//
//                                    manager.tableau[column].append(item)
//
//                                    manager.refresh()
//
//                                    return
//
//                                } else {
//
//                                    guard let last = manager.foundation[item.suit].last, last.rank == .queen else { break }
//
//                                    manager.waste.pile.removeAll(where: {  return $0.id == item.id })
//
//                                    manager.foundation[item.suit].append(item)
//
//                                    manager.refresh()
//
//                                    return
//                                }
//
//                            default: // anything else, see where there is a match and move it there
//
//                                if let last = manager.foundation[item.suit].last, last.rank == item.rank.previous {
//
//                                    manager.waste.pile.removeAll(where: {  return $0.id == item.id })
//
//                                    manager.foundation[item.suit].append(item)
//
//                                    manager.refresh()
//
//                                    return
//
//                                } else {
//                                    for column in Column.allCases {
//
//                                        guard let last = manager.tableau[column].last, last.rank == item.rank.next, last.suit.pair != item.suit.pair else { continue }
//
//                                        manager.waste.pile.removeAll(where: {  return $0.id == item.id })
//
//                                        manager.tableau[column].append(item)
//
//                                        manager.refresh()
//
//                                        return
//                                    }
//                                }
//                            }
                        }
                        
                        withAnimation(.easeIn(duration: 0.1)) {
                            view.numberOfShakes = 10
                        }
                        
                        view.numberOfShakes = 0
                    }
            }
        }
    }
}

struct WastePileView_Previews: PreviewProvider {
    
    @Namespace static private var pile
    
    
    static var previews: some View {
        WastePileView(ns: pile)
            .environmentObject(Game.instance)
    }
}
