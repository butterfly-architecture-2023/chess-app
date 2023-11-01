//
//  Rank.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/22.
//

enum Rank: Int, CaseIterable {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    var index: Int {
        return rawValue - 1
    }
}
