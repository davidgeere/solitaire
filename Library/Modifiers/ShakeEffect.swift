//
//  ShakeEffect.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation
import SwiftUI

struct ShakeEffect: AnimatableModifier {
    var shake_number: CGFloat = 0

    var animatableData: CGFloat {
        get {
            self.shake_number
        } set {
            self.shake_number = newValue
        }
    }

    func body(content: Content) -> some View {
        content.offset(x: sin(self.shake_number * .pi * 2) * 4)
    }
}
