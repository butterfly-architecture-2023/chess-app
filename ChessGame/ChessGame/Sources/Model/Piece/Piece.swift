//
//  Piece.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/17.
//

import Foundation

// 체스말
protocol Piece {
    var color: PieceColor { get }
    
    var symbol: String { get }
    
    var point: Int { get }
    
    var initialCoordinates: Set<PieceCoordinate> { get }
    
    init(color: PieceColor)
    
    func movableCoordinates(from coordinate: PieceCoordinate) -> [PieceCoordinate]
    
    func availableMovingCoordinates(
        from coordinate: PieceCoordinate,
        on squares: [[(any Piece)?]]
    ) -> [PieceCoordinate]
}
