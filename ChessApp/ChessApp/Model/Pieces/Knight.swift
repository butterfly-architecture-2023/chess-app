//
//  Knight.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct Knight: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        let ways = [
            rankTransformed(for: position, multiplier: +1),
            rankTransformed(for: position, multiplier: -1),
            fileTransformed(for: position, multiplier: +1),
            fileTransformed(for: position, multiplier: -1)
        ].flatMap { $0 }
        return Set(ways)
    }
    
    private func rankTransformed(for position: Position, multiplier: Int) -> [PieceMovingWay] {
        guard let forwardPosition = position.offsetBy(fileOffset: 0, rankOffset: multiplier) else {
            return []
        }
        return [
            forwardPosition.offsetBy(fileOffset: 1, rankOffset: multiplier),
            forwardPosition.offsetBy(fileOffset: -1, rankOffset: multiplier)
        ].compactMap { $0 }
            .map { [forwardPosition, $0] }
    }
    
    private func fileTransformed(for position: Position, multiplier: Int) -> [PieceMovingWay] {
        guard let forwardPosition = position.offsetBy(fileOffset: multiplier, rankOffset: 0) else {
            return []
        }
        return [
            forwardPosition.offsetBy(fileOffset: multiplier, rankOffset: 1),
            forwardPosition.offsetBy(fileOffset: multiplier, rankOffset: -1)
        ].compactMap { $0 }
            .map { [forwardPosition, $0] }
    }
    
    let maximumCount: Int = 2
    let score: Int = 5
}

extension Knight: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♞"
        case .white:
            return "♘"
        }
    }
}
