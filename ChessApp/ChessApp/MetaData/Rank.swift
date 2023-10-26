//
//  Rank.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/24.
//

import Foundation

enum Rank: String, Comparable, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    
    init?(_ character: Character) {
        guard let rank = Rank(rawValue: String(character)) else {
            return nil
        }
        
        self = rank
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.amount < rhs.amount
    }
}

extension Rank {

    func distance(with compared: Rank) -> Int {
        return abs(self.amount - compared.amount)
    }

    var amount: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        }
    }

}
