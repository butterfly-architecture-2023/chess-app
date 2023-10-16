//
//  Piece.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

protocol Piece {
    var color: PieceColor { get }
    
    func _movableCoordiantes(currentCoordinate: Board.Coordinate) -> [Board.Coordinate]
}
