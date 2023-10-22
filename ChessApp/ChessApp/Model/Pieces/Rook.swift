//
//  Rook.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct Rook: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        let ways = [
            rankTransformed(for: position, multiplier: +1),
            rankTransformed(for: position, multiplier: -1),
            fileTransformed(for: position, multiplier: +1),
            fileTransformed(for: position, multiplier: -1)
        ].map { PieceMovingWay(positions: $0) }
        return Set(ways)
    }
    
    private func rankTransformed(for position: Position, multiplier: Int) -> [Position] {
        return (1..<8).compactMap { (rank) -> Position? in
            position.offsetBy(fileOffset: 0, rankOffset: rank * multiplier)
        }
    }
    
    private func fileTransformed(for position: Position, multiplier: Int) -> [Position] {
        return (1..<8).compactMap { (file) -> Position? in
            position.offsetBy(fileOffset: file * multiplier, rankOffset: 0)
        }
    }
    
    let maximumCount: Int = 2
    let score: Int = 5
}

extension Rook: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
}
