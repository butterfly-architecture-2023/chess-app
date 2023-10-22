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
        let destinations = [
            forwardPosition.offsetBy(fileOffset: 1, rankOffset: multiplier),
            forwardPosition.offsetBy(fileOffset: -1, rankOffset: multiplier)
        ]
        return pieceMovingWays(destinations: destinations, with: forwardPosition)
    }
    
    private func fileTransformed(for position: Position, multiplier: Int) -> [PieceMovingWay] {
        guard let forwardPosition = position.offsetBy(fileOffset: multiplier, rankOffset: 0) else {
            return []
        }
        let destinations = [
            forwardPosition.offsetBy(fileOffset: multiplier, rankOffset: 1),
            forwardPosition.offsetBy(fileOffset: multiplier, rankOffset: -1)
        ]
        return pieceMovingWays(destinations: destinations, with: forwardPosition)
    }
    
    private func pieceMovingWays(destinations: [Position?], with forwardPosition: Position) -> [PieceMovingWay] {
        return destinations
            .compactMap { $0 }
            .map { position in
                PieceMovingWay(spots: [
                    PieceMovingWay.Spot(position: forwardPosition, canStop: false),
                    PieceMovingWay.Spot(position: position)
                ])
            }
    }
    
    let maximumCount: Int = 2
    let score: Int = 3
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
