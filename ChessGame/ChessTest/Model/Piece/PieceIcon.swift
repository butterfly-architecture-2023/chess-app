//
//  PieceIcon.swift
//  ChessGame
//
//  Created by 강호성 on 10/31/23.
//

import Foundation

enum PieceIcon {
    case blackPawn, blackKnight, blackBishop, blackRook, blackQueen, blackKing
    case whitePawn, whiteKnight, whiteBishop, whiteRook, whiteQueen, whiteKing
    case empty

    var unicode: String {
        switch self {
        case .blackPawn: return "\u{265F}"
        case .blackKnight: return "\u{265E}"
        case .blackBishop: return "\u{265D}"
        case .blackRook: return "\u{265C}"
        case .blackQueen: return "\u{265B}"
        case .blackKing: return "\u{265A}"
        case .whitePawn: return "\u{2659}"
        case .whiteKnight: return "\u{2658}"
        case .whiteBishop: return "\u{2657}"
        case .whiteRook: return "\u{2656}"
        case .whiteQueen: return "\u{2655}"
        case .whiteKing: return "\u{2654}"
        case .empty: return ""
        }
    }
}
