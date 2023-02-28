//
//  TableauPileView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct TableauPileView: View {
    
    @EnvironmentObject var game: Game
    @EnvironmentObject var tableau: Tableau
    
    var column: Column
    
    var table: Namespace.ID
    
    public init(_ column: Column, on table: Namespace.ID) {
        
        self.column = column
        self.table = table
        
    }
    
    var body: some View {
        
        ZStack( alignment: .topLeading) {
            
            VectorView("depot/open")
                .foregroundColor(.white.opacity(0.4))
                .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            VStack(spacing: GLOBALS.TABLE.SPACING - GLOBALS.CARD.HEIGHT) {
                ForEach($tableau[column].cards) { item in
                    
                    var item = item.wrappedValue
                    
                    CardView(item: item, in: table)
                        .onTap { view in
                            
                            withAnimation(.spring()) {
                                
//                                switch item.rank {
//                                case .ace: // if it's an ace, place it in the right foundation
//
//                                    game.tableau[column].removeAll(where: {  return $0.id == item.id })
//
//                                    if var last = game.tableau[column].last {
//                                        last.facing = .up
//
//                                        game.tableau.refresh()
//                                    }
//
//                                    item.facing = .up
//
//                                    game.foundation[item.suit].append(item)
//
//                                    game.refresh()
//
//                                    return
//
//                                case .king: // if it's a king place it in an empty tableau
//
//                                    if var open = game.tableau.open {
//
//                                        game.tableau[column].removeAll(where: {  return $0.id == item.id })
//
//                                        if var last = game.tableau[column].last {
//                                            last.facing = .up
//
//                                            game.tableau.refresh()
//                                        }
//
//                                        game.tableau[open].append(item)
//
//                                        game.refresh()
//
//                                        return
//
//                                    } else {
//
//                                        guard let last = game.foundation[item.suit].last, last.rank == .queen else { break }
//
//                                        game.tableau[column].removeAll(where: {  return $0.id == item.id })
//
//                                        if var last = game.tableau[column].last {
//                                            print("b last", last)
//
//                                            last.facing = .up
//
//                                            game.tableau.refresh()
//
//                                            print("a last", last)
//                                        }
//
//                                        game.foundation[item.suit].append(item)
//
//                                        game.refresh()
//
//                                        return
//                                    }
//
//                                default: // anything else, see where there is a match and move it there
//
//                                    if let last = game.foundation[item.suit].last, last.rank == item.rank.previous {
//
//                                        game.tableau[column].removeAll(where: {  return $0.id == item.id })
//
//                                        if var last = game.tableau[column].last {
//                                            print("b last", last)
//
//                                            last.facing = .up
//
//                                            game.tableau.refresh()
//
//                                            print("a last", last)
//                                        }
//
//                                        game.foundation[item.suit].append(item)
//
//                                        game.refresh()
//
//                                        return
//
//                                    } else {
//                                        for column in Column.allCases {
//
//                                            guard column != self.column else { continue }
//
//                                            guard let last = game.tableau[column].last, last.rank == item.rank.next, last.suit.pair != item.suit.pair else { continue }
//
//                                            game.tableau[column].removeAll(where: {  return $0.id == item.id })
//
//                                            if var last = game.tableau[column].last {
//
//                                                print("b last", last)
//
//                                                last.facing = .up
//
//                                                game.tableau.refresh()
//
//                                                print("a last", last)
//                                            }
//
//                                            game.tableau[column].append(item)
//
//                                            game.refresh()
//
//                                            return
//                                        }
//                                    }
//                                }
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
}

struct TableauPileView_Previews: PreviewProvider {
    
    @Namespace static private var tableau
    
    static var previews: some View {
        TableauPileView(.one, on: tableau)
            .environmentObject(Game.instance)
            .environmentObject(Tableau.instance)
    }
}
