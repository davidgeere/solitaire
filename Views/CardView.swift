//
//  CardView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct CardView: View {

    @State var item: Card
    @State var numberOfShakes: CGFloat
    
    private var onTapAction: ((CardView) -> Void)?
    
    private let axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    
    var ns: Namespace.ID
    
    @Namespace private var card
    
    init(item: Card, in namespace: Namespace.ID) {
        self._item = State(initialValue: item)
        self._numberOfShakes = State(initialValue: 0)
        
        self.axis = (x: .zero, y: 1, z: .zero)
        self.ns = namespace
    }
    
    var body: some View {
        
        Group {
            switch item.facing {
            case .up:
                VectorView("decks/chunky/\(item.suit.name)/\(item.rank.name)")
                    .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                    .matchedGeometryEffect(id: item.id, in: card)
                    .rotation3DEffect(.degrees(180), axis: self.axis)
                    
            case .down:
                VectorView("decks/chunky/back")
                    .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                    .matchedGeometryEffect(id: item.id, in: card)
                    .rotation3DEffect(.degrees(0), axis: self.axis)
            }
        }
        .modifier(ShakeEffect(shake_number: numberOfShakes))
        .rotation3DEffect(item.facing == .up ? .degrees(180): .zero, axis: self.axis)
        .animation(.easeIn(duration: 0.3), value: item.facing)
        .onTapGesture {
            if let onTapAction {
                onTapAction(self)
            }
        }
        .matchedGeometryEffect(id: item.id, in: ns)//, isSource: manager.selectedItem != item)
    }
    
    public func onTap(_ handler: @escaping (CardView) -> Void) -> CardView {
        var new = self
        new.onTapAction = handler
        return new
    }
}

struct CardView_Previews: PreviewProvider {
    
    @Namespace static private var card
    
    static var previews: some View {
        CardView(item: Card(suit: .diamonds, rank: .three), in: card)
    }
}
