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
    
    func movableCoordinates(from: PieceCoordinate) -> [PieceCoordinate]
    
    init(color: PieceColor)
}
