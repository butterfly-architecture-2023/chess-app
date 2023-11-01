//
//  Queen.swift
//  ChessGame
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

struct Queen: Piece {
    var icon: PieceIcon
    var color: Color
    let maxCount: Int
    var score: Int

    init(color: Color) {
        self.color = color
        icon = color == .black ? .blackQueen : .whiteQueen
        maxCount = 1
        score = 0
    }
}
