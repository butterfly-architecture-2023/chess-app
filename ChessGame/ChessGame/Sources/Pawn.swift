//
//  Pawn.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/29.
//

import Foundation

struct Pawn: Piece {
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            "♟"
        case .white:
            "♙"
        }
    }
    
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
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func movableCoordinates(from: PieceCoordinate) -> [PieceCoordinate] {
        switch color {
        case .black:
            guard 
                let increasedRank = PieceCoordinate.Rank(rawValue: from.rank.rawValue + 1)
            else { return [] }
            
            return [
                .init(rank: increasedRank, file: from.file)
            ]
        case .white:
            guard
                let decreasedRank = PieceCoordinate.Rank(rawValue: from.rank.rawValue - 1)
            else { return [] }
            
            return [
                .init(rank: decreasedRank, file: from.file)
            ]
        }
    }
}
