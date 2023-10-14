//
//  Square.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Square {
    private var piece: Piece?
    
    init(piece: Piece? = nil) {
        self.piece = piece
    }
    
    func isEmpty() -> Bool {
        self.piece == nil
    }
}
