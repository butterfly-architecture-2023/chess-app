//
//  Bishop.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/31.
//

import Foundation

struct Bishop: Piece {
    
    // MARK: - property
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    var point: Int { 3 }
    
    var initialCoordinates: Set<PieceCoordinate> {
        switch color {
        case .black:
            return [
                .init(rank: .one, file: .C),
                .init(rank: .one, file: .F)
            ]
        case .white:
            return [
                .init(rank: .eight, file: .C),
                .init(rank: .eight, file: .F)
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
        
        let directions = [(1, 1), (1, -1), (-1, 1), (-1, -1)]
           
        for direction in directions {
            var nextRank = coordinate.rank.rawValue + direction.0
            var nextFile = coordinate.file.rawValue + direction.1
            
            while nextRank >= 0
                    && nextRank < PieceCoordinate.Rank.allCases.count
                    && nextFile >= 0
                    && nextFile < PieceCoordinate.File.allCases.count,
                  let nextRankEnum = PieceCoordinate.Rank(rawValue: nextRank),
                  let nextFileEnum = PieceCoordinate.File(rawValue: nextFile)
            {
                let nextCoordinate = PieceCoordinate(
                    rank: nextRankEnum,
                    file: nextFileEnum
                )
                result.append(nextCoordinate)
                
                nextRank += direction.0
                nextFile += direction.1
            }
        }
        
        return result
    }
}
