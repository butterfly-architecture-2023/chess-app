//
//  Pawn.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/29.
//

import Foundation

struct Pawn: Piece {
    
    // MARK: - property
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            "♟"
        case .white:
            "♙"
        }
    }
    
    var point: Int { 1 }
    
    var initialCoordinates: Set<PieceCoordinate> {
        switch color {
        case .black:
            return [
                .init(rank: .two, file: .A),
                .init(rank: .two, file: .B),
                .init(rank: .two, file: .C),
                .init(rank: .two, file: .D),
                .init(rank: .two, file: .E),
                .init(rank: .two, file: .F),
                .init(rank: .two, file: .G),
                .init(rank: .two, file: .H)
            ]
        case .white:
            return [
                .init(rank: .seven, file: .A),
                .init(rank: .seven, file: .B),
                .init(rank: .seven, file: .C),
                .init(rank: .seven, file: .D),
                .init(rank: .seven, file: .E),
                .init(rank: .seven, file: .F),
                .init(rank: .seven, file: .G),
                .init(rank: .seven, file: .H)
            ]
        }
    }
    
    // MARK: - initialize
    
    init(color: PieceColor) {
        self.color = color
    }
    
    // MARK: - method
    
    func movableCoordinates(from coordinate: PieceCoordinate) -> [PieceCoordinate] {
        switch color {
        case .black:
            guard
                let increasedRank = PieceCoordinate.Rank(rawValue: coordinate.rank.rawValue + 1)
            else { return [] }
            
            return [
                .init(rank: increasedRank, file: coordinate.file)
            ]
        case .white:
            guard
                let decreasedRank = PieceCoordinate.Rank(rawValue: coordinate.rank.rawValue - 1)
            else { return [] }
            
            return [
                .init(rank: decreasedRank, file: coordinate.file)
            ]
        }
    }
    
    func availableMovingCoordinates(
        from coordinate: PieceCoordinate,
        on squares: [[(Piece)?]]
    ) -> [PieceCoordinate] {
        return movableCoordinates(from: coordinate)
    }
}
