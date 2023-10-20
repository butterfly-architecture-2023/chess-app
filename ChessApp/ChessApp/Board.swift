//
//  Board.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct Board {
    typealias Coordinate = (file: File, rank: Rank)
    typealias Squares = [Rank: [File: Piece?]]
    
    private(set) var squares: Squares
    
    init(squares: Squares = BoardMaker.make()) {
        self.squares = squares
    }
    
    func _movableCoordinates(from coordinate: Coordinate) -> [Coordinate] {
        guard let piece = self.squares[coordinate.rank]?[coordinate.file] as? Piece else { return [] }
        return piece._movableCoordinates(from: coordinate)
    }
    
    mutating func move(from currentCoordinate: Coordinate, to targetCoordinate: Coordinate) -> Bool {
        guard let currentPiece = self.squares[currentCoordinate.rank]?[currentCoordinate.file] as? Piece else { return false }
        guard let targetPiece = self.squares[targetCoordinate.rank]?[targetCoordinate.file] as? Piece else {
            self.squares[targetCoordinate.rank]?[targetCoordinate.file] = currentPiece
            self.squares[currentCoordinate.rank]?[currentCoordinate.file] = nil
            return true
        }
        
        guard targetPiece.color != currentPiece.color else { return false }
        self.squares[targetCoordinate.rank]?[targetCoordinate.file] = currentPiece
        self.squares[currentCoordinate.rank]?[currentCoordinate.file] = nil
        return true
    }
}
