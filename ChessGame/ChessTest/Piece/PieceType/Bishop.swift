//
//  Bishop.swift
//  ChessGame
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

struct Bishop: Piece {
    var icon: PieceIcon
    var color: Color
    let maxCount: Int
    var score: Int

    init(color: Color) {
        self.color = color
        icon = color == .black ? .blackBishop : .whiteBishop
        maxCount = 2
        score = 0
    }
}
