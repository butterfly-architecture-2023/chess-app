//
//  Rank.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/24.
//

import Foundation

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
