//
//  Board.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Board {
    private(set) var pieces: [Piece] = []
    
    init(pieces: [Piece]) {
        self.pieces = pieces
    }
    
    func score(for color: Color) -> Int {
        pieces.filter { $0.color == color }.count
    }
    
    func move(from: Position, to: Position) -> Bool {
        // TODO
        false
    }
}
