//
//  Bishop.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/20.
//

import Foundation

struct Bishop: Piece {
    let color: Color
    
    func availableMovePositions(for position: Position) -> Set<Position> {
        let transformed = (1..<8).flatMap { stride in
            [
                Position.Rank(position.rank.rawValue - stride),
                Position.Rank(position.rank.rawValue + stride)
            ]
                .compactMap { $0 }
                .flatMap { rank in
                    [
                        Position.File(position.file.rawValue - stride),
                        Position.File(position.file.rawValue + stride)
                    ]
                        .compactMap { $0 }
                        .map { file in
                            Position(file: file, rank: rank)
                        }
                }
        }
        
        return Set(transformed)
    }
    
    let maximumCount: Int = 2
    let score: Int = 3
}

extension Bishop: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
}
