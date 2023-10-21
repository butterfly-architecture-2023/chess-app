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
            rankTransformed(for: position, transform: +),
            rankTransformed(for: position, transform: -),
            fileTransformed(for: position, transform: +),
            fileTransformed(for: position, transform: -)
        ].map { PieceMovingWay(rawValue: $0) }
        return Set(ways)
    }
    
    private func rankTransformed(for position: Position, transform: (Int, Int) -> Int) -> [Position] {
        return (1..<8).compactMap { (rank) -> Position? in
            guard let rank = Position.Rank(transform(position.rank.rawValue, rank)) else { return nil }
            return Position(file: position.file, rank: rank)
        }
    }
    
    private func fileTransformed(for position: Position, transform: (Int, Int) -> Int) -> [Position] {
        return (1..<8).compactMap { (file) -> Position? in
            guard let file = Position.File(transform(position.file.rawValue, file)) else { return nil }
            return Position(file: file, rank: position.rank)
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
