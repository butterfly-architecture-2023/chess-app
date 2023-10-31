//
//  Rook.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct Rook: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        return [
            .init(for: position, rankMultiplier: +1),
            .init(for: position, rankMultiplier: -1),
            .init(for: position, fileMultiplier: +1),
            .init(for: position, fileMultiplier: -1),
        ]
    }
    static let maximumCount: Int = 2
    static let score: Int = 5
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
