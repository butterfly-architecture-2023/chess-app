//
//  Pawn.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

import Foundation

enum PawnType: String {
    case none = "."
    case black = "♟"
    case white = "♙"
}

struct Pawn {
    let pawnType: PawnType
    let position: Position
    
    static var emptyPawnList: [[Pawn]] {
        let list = Column.allCases.map { column in
            return  (1...8).map { Pawn(pawnType: .none, position: Position(rank: $0, column: column)) }
        }
        return list
    }
    
    static var firstBlackPawnList: [Pawn] {
        let list = Column.allCases.map {
            return Pawn(pawnType: .black, position: Position(rank: 2, column: $0))
        }
        return list
    }
    
    static var firstWhitePawnList: [Pawn] {
        let list = Column.allCases.map {
            return Pawn(pawnType: .white,  position: Position(rank: 7, column: $0))
        }
        return list
    }
}

