//
//  Pawn.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Pawn: Piece {
    let color: Color
    var position: Position
    
    var availableMovePositions: Set<Position> {
        let stride = {
            switch color {
            case .black:
                return 1
            case .white:
                return -1
            }
        }()
        let expectedRank = Int(position.rank.rawValue) + stride
        guard expectedRank > 0,
              let rank = Position.Rank(UInt8(expectedRank)) else { return [] }
        return [Position(file: position.file, rank: rank)]
    }
    
    let score: Int = 1
    let maximumCount: Int = 8
}

extension Pawn: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
}
