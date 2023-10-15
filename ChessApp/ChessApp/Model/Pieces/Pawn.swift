//
//  Pawn.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Pawn: Piece {
    let color: Color
    var position: Position
    
    var availableMovePositions: Set<Position> {
        let stride = color == .black ? 1 : -1
        guard let rank = Position.Rank(UInt8(Int(position.rank.value) + stride)) else { return [] }
        return [Position(file: position.file, rank: rank)]
    }
}
