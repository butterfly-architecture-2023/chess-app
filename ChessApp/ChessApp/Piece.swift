//
//  Piece.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

protocol Piece {
    var color: PieceColor { get }
    var icon: String { get }
    
    func _movableCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate]
}
