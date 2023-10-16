//
//  Board.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Board {
    typealias Coordinate = (file: File, rank: Rank)
    
    private let squares: [Square]
    
    init(squares: [Square] = BoardMaker.make()) {
        self.squares = squares
    }
    
    func move(from currentCoordinate: Coordinate, to nextCoordinate: Coordinate) -> Bool {
        guard let currentSquare = self.squares.first(where: { $0.rank == currentCoordinate.rank && $0.file == currentCoordinate.file }),
              let nextSquare = self.squares.first(where: { $0.rank == nextCoordinate.rank && $0.file == nextCoordinate.file }) else { return false }
        
        guard let currentSquarePiece = currentSquare.piece else { return false }
        guard nextSquare.put(otherPiece: currentSquarePiece) else { return false }
        currentSquare.deletePiece()
        return true
    }
}
