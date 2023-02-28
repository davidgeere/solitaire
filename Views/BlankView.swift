//
//  BlankView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        Color.clear // spacer
            .aspectRatio(GLOBALS.CARD.RATIO, contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
