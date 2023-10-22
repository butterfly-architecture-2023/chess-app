//
//  Queen.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/22.
//

import Foundation

struct Queen: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        return [
            .init(for: position, fileMultiplier: 0, rankMultiplier: +1, repeat: 8),
            .init(for: position, fileMultiplier: 0, rankMultiplier: -1, repeat: 8),
            .init(for: position, fileMultiplier: +1, rankMultiplier:  0, repeat: 8),
            .init(for: position, fileMultiplier: -1, rankMultiplier:  0, repeat: 8),
            .init(for: position, fileMultiplier: -1, rankMultiplier: -1, repeat: 8),
            .init(for: position, fileMultiplier: -1, rankMultiplier: +1, repeat: 8),
            .init(for: position, fileMultiplier: +1, rankMultiplier: -1, repeat: 8),
            .init(for: position, fileMultiplier: +1, rankMultiplier: +1, repeat: 8),
        ]
    }
    let maximumCount: Int = 1
    let score: Int = 9
}

extension Queen: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♛"
        case .white:
            return "♕"
        }
    }
}
