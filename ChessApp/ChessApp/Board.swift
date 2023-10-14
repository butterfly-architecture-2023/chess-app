//
//  Board.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Board {
    private var squares: [Square]
    
    init(squares: [Square] = BoardMaker.make()) {
        self.squares = squares
    }
}
