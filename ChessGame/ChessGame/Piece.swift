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
    }

    let category: Category
}
