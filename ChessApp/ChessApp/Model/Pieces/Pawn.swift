//
//  Pawn.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Pawn: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        let stride = {
            switch color {
            case .black:
                return 1
            case .white:
                return -1
            }
        }()
        guard let position = position.offsetBy(fileOffset: 0, rankOffset: stride) else { return [] }
        return [PieceMovingWay(positions: [position])]
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
