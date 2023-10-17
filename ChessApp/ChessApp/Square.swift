//
//  Square.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

class Square {
    let rank: Board.Rank
    let file: Board.File
    
    private(set) var piece: Piece?
    
    init(rank: Board.Rank, file: Board.File, piece: Piece? = nil) {
        self.rank = rank
        self.file = file
        self.piece = piece
    }
    
    func canMoveAt() -> [Board.Coordinate] {
        let coordinate: Board.Coordinate = (self.file, self.rank)
        guard let movableCoordinates = self.piece?.canMove(from: coordinate) else { return [] }
        return movableCoordinates
    }
    
    func put(otherPiece: Piece) -> Bool {
        guard let piece else {
            self.piece = otherPiece
            return true
        }
        
        if piece.color != otherPiece.color {
            self.piece = otherPiece
            return true
        }
        
        return false
    }
    
    func deletePiece() {
        self.piece = nil
    }
}
