//
//  King.swift
//  ChessGame
//
//  Created by 강호성 on 10/31/23.
//

import Foundation

struct King: Piece {
    var icon: PieceIcon
    var color: Color
    let maxCount: Int
    var score: Int

    init(color: Color) {
        self.color = color
        icon = color == .black ? .blackKing : .whiteKing
        maxCount = 1
        score = 0
    }
}
