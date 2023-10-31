//
//  Queen.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/31.
//

import Foundation

struct Queen: Piece {
    
    // MARK: - property
    
    let color: PieceColor
    
    var symbol: String {
        switch color {
        case .black:
            "♛"
        case .white:
            "♕"
        }
    }
    
    var point: Int { 9 }
    
    var initialCoordinates: Set<PieceCoordinate> {
        switch color {
        case .black:
            return [
                .init(rank: .one, file: .E),
            ]
        case .white:
            return [
                .init(rank: .eight, file: .E),
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
            (1, 0), (0, 1), (-1, 0), (0, -1), // 상하좌우
            (1, 1), (-1, -1), (-1, 1), (1, -1) // 대각선
        ]
        
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
                let nextCoordinate = PieceCoordinate(rank: nextRankEnum, file: nextFileEnum)
                result.append(nextCoordinate)
                
                nextRank += direction.0
                nextFile += direction.1
            }
        }
        
        return result
    }
    
    func availableMovingCoordinates(
        from coordinate: PieceCoordinate,
        on squares: [[(Piece)?]]
    ) -> [PieceCoordinate] {
        var result: [PieceCoordinate] = []
        
        let directions = [
            (1, 0), (0, 1), (-1, 0), (0, -1), // 상하좌우
            (1, 1), (-1, -1), (-1, 1), (1, -1) // 대각선
        ]
        
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
                let nextCoordinate = PieceCoordinate(rank: nextRankEnum, file: nextFileEnum)
                
                if let piece = squares[nextCoordinate.rank.rawValue][nextCoordinate.file.rawValue] {
                    if piece.color != self.color { result.append(nextCoordinate) }
                    
                    break
                } else {
                    result.append(nextCoordinate)
                }
                
                
                nextRank += direction.0
                nextFile += direction.1
            }
        }
        
        return result
    }
    
}
