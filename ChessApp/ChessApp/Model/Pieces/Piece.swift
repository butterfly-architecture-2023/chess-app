//
//  Piece.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

protocol Piece: CustomStringConvertible {
    var color: Color { get }
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay>
    
    var maximumCount: Int { get }
    var score: Int { get }
}

extension Piece {
    var type: String { String(describing: Self.self) }
}
