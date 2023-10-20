//
//  Location.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Location: Hashable {
    let file: File
    let rank: Rank
}

enum File: String, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
    
    init?(_ character: Character) {
        guard let file = File(rawValue: String(character)) else {
            return nil
        }
        
        self = file
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
    
    func distance(with compared: Rank) -> Int {
        return abs(self.rawValue - compared.rawValue)
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
