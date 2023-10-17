//
//  Location.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Location: Hashable {
    let capital: Capital
    let rank: Rank
}

enum Capital: String, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
    
    init(index: Int) {
        self = Capital.allCases[index]
    }
    
    init?(_ character: Character) {
        guard let capital = Capital(rawValue: String(character)) else {
            return nil
        }
        
        self = capital
    }
}

enum Rank: Int, Comparable, CaseIterable {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    init(index: Int) {
        self = Rank.allCases[index]
    }
    
    func distance(with compared: Rank) -> Int {
        return abs(self.rawValue - compared.rawValue)
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
