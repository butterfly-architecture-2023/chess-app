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
        
        let moves = [
            (2, 1), (1, 2), (-1, 2), (-2, 1),
            (-2, -1), (-1, -2), (1, -2), (2, -1)
        ]
        
        for move in moves {
            let nextRank = coordinate.rank.rawValue + move.0
            let nextFile = coordinate.file.rawValue + move.1
            
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
    
    func availableMovingCoordinates(
        from coordinate: PieceCoordinate,
        on squares: [[(Piece)?]]
    ) -> [PieceCoordinate] {
        var result: [PieceCoordinate] = []
        
        let moves = [
            (1, 2), (2, 1), (-1, 2), (2, -1), (-2, 1), (1, -2), (-1, -2), (-2, -1)
        ]
        
        for move in moves {
            let newRankRawValue = coordinate.rank.rawValue + move.0
            let newFileRawValue = coordinate.file.rawValue + move.1
            
            if newRankRawValue >= 0, newRankRawValue < 8, newFileRawValue >= 0, newFileRawValue < 8 {
                let newRank = PieceCoordinate.Rank(rawValue: newRankRawValue)!
                let newFile = PieceCoordinate.File(rawValue: newFileRawValue)!
                let newCoordinate = PieceCoordinate(rank: newRank, file: newFile)
                
                // 전진하는 칸에 다른 말이 있는지 확인
                let forwardRankRawValue = coordinate.rank.rawValue + move.0 / 2
                let forwardFileRawValue = coordinate.file.rawValue + move.1 / 2
                
                if forwardRankRawValue >= 0, forwardRankRawValue < 8, forwardFileRawValue >= 0, forwardFileRawValue < 8 {
                    let forwardRank = PieceCoordinate.Rank(rawValue: forwardRankRawValue)!
                    let forwardFile = PieceCoordinate.File(rawValue: forwardFileRawValue)!
                    let forwardCoordinate = PieceCoordinate(rank: forwardRank, file: forwardFile)
                    
                    if squares[forwardRank.rawValue][forwardFile.rawValue] != nil {
                        continue // 전진하는 칸에 다른 말이 있다면 이 방향으로는 움직이지 않음
                    }
                }
                
                // 최종 좌표에 동일한 색상의 말이 있는지 확인
                if let pieceAtDestination = squares[newRank.rawValue][newFile.rawValue], pieceAtDestination.color == self.color {
                    continue
                }
                
                result.append(newCoordinate)
            }
        }
        
        return result
    }
}
