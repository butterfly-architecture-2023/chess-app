//
//  Pieces.swift
//  chess-app
//
//  Created by Jihee hwang on 2023/10/22.
//

import Foundation

// MARK: - Piece

struct Piece {
    let type: PieceType
    let color: PieceColor
    
    init(type: PieceType, color: PieceColor) {
        self.type = type
        self.color = color
    }
}

// MARK: - PieceType

enum PieceType {
    case pawn, rook, knight, bishop, queen, king, none
}

// MARK: - PieceColor

enum PieceColor {
    case black, white, none
    
    var symbol: String {
        switch self {
        case .black:
            return "\u{265F}"
        case .white:
            return "\u{2659}"
        case .none:
            return "."
        }
    }
}
