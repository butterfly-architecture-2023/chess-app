//
//  Position.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

struct Position {
    let rank: Int
    let column: Column
}

extension Position: Equatable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.column.rawValue == rhs.column.rawValue && lhs.rank == rhs.rank
    }
}
