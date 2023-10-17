//
//  Piece.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/18.
//

import Foundation

struct Piece {

    enum Color {
        case black
        case white
    }
    
    enum Category: Equatable {
        case pawn(color: Color)
        case empty
        
        var unicode: String {
            switch self {
            case .pawn(let color):
                return color == .black ? "\u{265F}" : "\u{2659}"
            case .empty:
                return "\u{002E}"
            }
        }
    }
    
    let category: Category
}
