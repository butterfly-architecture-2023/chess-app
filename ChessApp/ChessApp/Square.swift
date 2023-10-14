//
//  Square.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Square {
    private let rank: Board.Rank
    private let file: Board.File
    private var piece: Piece?
    
    init(rank: Board.Rank, file: Board.File, piece: Piece? = nil) {
        self.rank = rank
        self.file = file
        self.piece = piece
    }
    
    func isEmpty() -> Bool {
        self.piece == nil
    }
}
