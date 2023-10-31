//
//  Knight.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/31.
//

import Foundation

struct Knight: Piece {
    
    // MARK: - property
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            return "♞"
        case .white:
            return "♘"
        }
    }
    
    var point: Int { 3 }
    
    var initialCoordinates: Set<PieceCoordinate> {
        switch color {
        case .black:
            return [
                .init(rank: .one, file: .B),
                .init(rank: .one, file: .G)
            ]
        case .white:
            return [
                .init(rank: .eight, file: .B),
                .init(rank: .eight, file: .G)
            ]
        }
    }
    
    // MARK: - initialize
    
    init(color: PieceColor) {
        self.color = color
    }
    
    // MARK: - method
    
    func movableCoordinates(from coordinate: PieceCoordinate) -> [PieceCoordinate] {
        var result: [PieceCoordinate] = []
        
        let directions = [
            (2, 1), (1, 2), (-1, 2), (-2, 1),
            (-2, -1), (-1, -2), (1, -2), (2, -1)
        ]
        
        for direction in directions {
            let nextRank = coordinate.rank.rawValue + direction.0
            let nextFile = coordinate.file.rawValue + direction.1
            
            if nextRank >= 0 
                && nextRank < PieceCoordinate.Rank.allCases.count
                && nextFile >= 0
                && nextFile < PieceCoordinate.File.allCases.count,
               let nextRankEnum = PieceCoordinate.Rank(rawValue: nextRank),
               let nextFileEnum = PieceCoordinate.File(rawValue: nextFile)
            {
                let nextCoordinate = PieceCoordinate(rank: nextRankEnum, file: nextFileEnum)
                result.append(nextCoordinate)
            }
        }
        
        return result
    }
}
