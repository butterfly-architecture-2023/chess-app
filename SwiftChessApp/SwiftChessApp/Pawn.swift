//
//  Pawn.swift
//  SwiftChessApp
//
//  Created by Han Songe on 2023/10/18.
//

import Foundation

struct Pawn: Piece {
    let color: PieceColor
    var symbol: String {
        switch color {
        case .black:
            return "\u{265F}"
        case .white:
            return "\u{2659}"
        }
    }
}
