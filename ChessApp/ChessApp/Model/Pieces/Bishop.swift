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
            availableMovingWay(for: position, fileMultiplier: -1, rankMultiplier: -1),
            availableMovingWay(for: position, fileMultiplier: -1, rankMultiplier: +1),
            availableMovingWay(for: position, fileMultiplier: +1, rankMultiplier: -1),
            availableMovingWay(for: position, fileMultiplier: +1, rankMultiplier: +1)
        ]
    }
    
    private func availableMovingWay(for position: Position,
                                    fileMultiplier: Int,
                                    rankMultiplier: Int) -> PieceMovingWay {
        let positions = (1..<8).compactMap { (stride: Int) -> Position? in
            return position.offsetBy(fileOffset: stride * fileMultiplier, rankOffset: stride * rankMultiplier)
        }
        return PieceMovingWay(rawValue: positions)
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
