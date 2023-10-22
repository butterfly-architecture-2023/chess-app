//
//  Pieces.swift
//  chess-app
//
//  Created by Jihee hwang on 2023/10/22.
//

import Foundation

// MARK: - Piece

struct Piece {
    var type: PieceType
    var color: PieceColor
    
    init(type: PieceType, color: PieceColor) {
        self.type = type
        self.color = color
    }
}

// MARK: - PieceType

enum PieceType {
    case pawn, rook, knight, bishop, queen, king
}

// MARK: - PieceColor

enum PieceColor {
    case black, white
    
    var symbol: String {
        switch self {
        case .black:
            return "\u{265F}"
        case .white:
            return "\u{2659}"
        }
    }
}
