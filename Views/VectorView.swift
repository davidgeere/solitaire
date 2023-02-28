//
//  VectorView.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import SwiftUI

struct VectorView: View {
    
    var name: String
    
    public init(name: String) {
        self.init(name)
    }
    
    public init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        
        Image(self.name)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
