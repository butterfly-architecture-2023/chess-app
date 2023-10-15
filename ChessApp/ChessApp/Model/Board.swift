//
//  Board.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Board {
    private(set) var pieces: [Position: Piece] = [:]
    
    init(pieces: [Piece]) {
        let piecePairs = pieces.map { ($0.position, $0) }
        self.pieces = [Position: Piece](uniqueKeysWithValues: piecePairs)
    }
    
    func score(for color: Color) -> Int {
        pieces.values
            .filter { $0.color == color }
            .count
    }
    
    mutating func move(from: Position, to: Position) -> Bool {
        guard canMove(from: from, to: to) else {
            return false
        }
        
        pieces[to] = pieces[from]
        pieces[from] = nil
        return true
    }
    
    private func canMove(from: Position, to: Position) -> Bool {
        guard let fromPiece = pieces[from],
                fromPiece.availableMovePositions.contains(to) else { return false }
        guard let toPiece = pieces[to] else { return true }
        return fromPiece.color != toPiece.color
    }
}
