//
//  Position.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

struct Position {
    let rank: Rank
    let column: Column
}

extension Position: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
        hasher.combine(column)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rank == rhs.rank && lhs.column == rhs.column
    }
}
