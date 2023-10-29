//
//  Pawn.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/29.
//

import Foundation

struct Pawn: Piece {
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            "♟"
        case .white:
            "♙"
        }
    }
    
    var initialPositions: Set<PieceCoordinate> {
        switch color {
        case .black:
            return [
                .init(rank: .two, file: .A),
                .init(rank: .two, file: .B),
                .init(rank: .two, file: .C),
                .init(rank: .two, file: .D),
                .init(rank: .two, file: .E),
                .init(rank: .two, file: .F),
                .init(rank: .two, file: .G),
                .init(rank: .two, file: .H)
            ]
        case .white:
            return [
                .init(rank: .seven, file: .A),
                .init(rank: .seven, file: .B),
                .init(rank: .seven, file: .C),
                .init(rank: .seven, file: .D),
                .init(rank: .seven, file: .E),
                .init(rank: .seven, file: .F),
                .init(rank: .seven, file: .G),
                .init(rank: .seven, file: .H)
            ]
        }
    }
    
    init(color: PieceColor) {
        self.color = color
    }
}
