//
//  Tabeleau.swift
//  solitaire
//
//  Created by David Geere on 2/27/23.
//

import Foundation

class Tableau: ObservableObject {
    
    @Published var one: TableauPile
    @Published var two: TableauPile
    @Published var three: TableauPile
    @Published var four: TableauPile
    @Published var five: TableauPile
    @Published var six: TableauPile
    @Published var seven: TableauPile
    
    public init() {
        self.one = TableauPile(.one)
        self.two = TableauPile(.two)
        self.three = TableauPile(.three)
        self.four = TableauPile(.four)
        self.five = TableauPile(.five)
        self.six = TableauPile(.six)
        self.seven = TableauPile(.seven)
    }
    
    public var count: Int {
        return (self.one.cards.count +
                self.two.cards.count +
                self.three.cards.count +
                self.four.cards.count +
                self.five.cards.count +
                self.six.cards.count +
                self.seven.cards.count)
    }
    
    public func clear() {
        
        self.one.clear()
        self.two.clear()
        self.three.clear()
        self.four.clear()
        self.five.clear()
        self.six.clear()
        self.seven.clear()
        
    }
    
    public var open: Column? {
        for column in Column.allCases {
            guard self[column].isEmpty else { continue }
            
            return column
        }
        
        return nil
    }
    
    public var hasOpen: Bool {
        for column in Column.allCases {
            guard self[column].isEmpty else { continue }
            
            return true
        }
        
        return false
    }
    
    subscript(column: Column) -> TableauPile {
        get {
            switch column {
            case .one: return self.one
            case .two: return self.two
            case .three: return self.three
            case .four: return self.four
            case .five: return self.five
            case .six: return self.six
            case .seven: return self.seven
            }
        }
        
        set {
            switch column {
            case .one: self.one = newValue
            case .two: self.two = newValue
            case .three: self.three = newValue
            case .four: self.four = newValue
            case .five: self.five = newValue
            case .six: self.six = newValue
            case .seven: self.seven = newValue
            }
        }
    }
    
    public func refresh() {
        self.objectWillChange.send()
    }
    
    public static var instance = Tableau()
}
