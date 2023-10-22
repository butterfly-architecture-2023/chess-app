//
//  Bishop.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/20.
//

import Foundation

struct Bishop: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        [
            .init(for: position, fileMultiplier: -1, rankMultiplier: -1, repeat: 8),
            .init(for: position, fileMultiplier: -1, rankMultiplier: +1, repeat: 8),
            .init(for: position, fileMultiplier: +1, rankMultiplier: -1, repeat: 8),
            .init(for: position, fileMultiplier: +1, rankMultiplier: +1, repeat: 8),
        ]
    }
    
    static let maximumCount: Int = 2
    static let score: Int = 3
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
