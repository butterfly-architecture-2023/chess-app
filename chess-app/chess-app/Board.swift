//
//  Board.swift
//  chess-app
//
//  Created by 윤소희 on 2023/10/15.
//

import Foundation

class Board {
    
    let blackPawn = "\u{265F}"
    let whitePawn = "\u{2659}"
    var blackScore: Int = 0
    var whiteScore: Int = 0
    var board = Array(repeating: Array(repeating: ".", count: 8), count:8)
    
    func resetBoard() {
        board = Array(repeating: Array(repeating: ".", count: 8), count:8)
        board[1] = Array(repeating: blackPawn, count: 8)
        board[6] = Array(repeating: whitePawn, count: 8)
    }
    
    func resetScore() {
        blackScore = 8
        whiteScore = 8
    }
    
}

