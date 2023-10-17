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
    
    
    
}

