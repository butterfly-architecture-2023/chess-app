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
            .init(for: position, rankMultiplier: +1),
            .init(for: position, rankMultiplier: -1),
            .init(for: position, fileMultiplier: +1),
            .init(for: position, fileMultiplier: -1),
            .init(for: position, fileMultiplier: -1, rankMultiplier: -1),
            .init(for: position, fileMultiplier: -1, rankMultiplier: +1),
            .init(for: position, fileMultiplier: +1, rankMultiplier: -1),
            .init(for: position, fileMultiplier: +1, rankMultiplier: +1),
        ]
    }
    
    static let maximumCount: Int = 1
    static let score: Int = 9
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
