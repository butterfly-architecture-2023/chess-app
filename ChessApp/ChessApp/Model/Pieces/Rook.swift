//
//  Rook.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct Rook: Piece {
    let color: Color
    
    func availableMovePositions(for position: Position) -> Set<Position> {
        let rankTransformed = Position.Rank.range.flatMap { rank in
            [
                Position.Rank(position.rank.rawValue - rank),
                Position.Rank(position.rank.rawValue + rank)
            ]
                .compactMap { $0 }
                .map {
                    Position(file: position.file, rank: $0)
                }
        }
        let fileTransformed = Position.File.range.flatMap { file in
            [
                Position.File(position.file.rawValue - file),
                Position.File(position.file.rawValue + file)
            ]
                .compactMap { $0 }
                .map {
                    Position(file: $0, rank: position.rank)
                }
        }
        return Set(rankTransformed).union(fileTransformed).subtracting([position])
    }
    
    let maximumCount: Int = 2
    let score: Int = 5
}

extension Rook: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
}
