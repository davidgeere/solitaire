//
//  CardView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct CardView: View {

    @Binding var card: Card
    @State var numberOfShakes: CGFloat
    
    private var onTapAction: ((CardView) -> Void)?
    
    private let axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    
    var ns: Namespace.ID
    
    @Namespace private var side
    
    init(card: Binding<Card>, in namespace: Namespace.ID) {
        self._card = Binding(projectedValue: card)
        self._numberOfShakes = State(initialValue: 0)
        
        self.axis = (x: .zero, y: 1, z: .zero)
        self.ns = namespace
    }
    
    var body: some View {
        
        Group {
            switch card.facing {
            case .up:
                VectorView("decks/chunky/\(card.suit.name)/\(card.rank.name)")
                    .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                    .matchedGeometryEffect(id: card.id, in: side)
                    .rotation3DEffect(.degrees(180), axis: self.axis)
                    
            case .down:
                VectorView("decks/chunky/back")
                    .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
                    .matchedGeometryEffect(id: card.id, in: side)
                    .rotation3DEffect(.degrees(0), axis: self.axis)
            }
        }
        .modifier(ShakeEffect(shake_number: numberOfShakes))
        .rotation3DEffect(card.facing == .up ? .degrees(180): .zero, axis: self.axis)
        .animation(.easeIn(duration: 0.3), value: card.facing)
        .onTapGesture {
            if let onTapAction {
                onTapAction(self)
            }
        }
        .matchedGeometryEffect(id: card.id, in: ns)//, isSource: manager.selectedItem != item)
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
        CardView(card: .constant(Card(suit: .diamonds, rank: .three)), in: card)
    }
}
