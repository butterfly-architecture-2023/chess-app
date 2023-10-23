//
//  Knight.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/23.
//

import Foundation

struct Knight: Piece {
    static let maxCount: Int = 2
    static let score: Int = 3
    
    var color: Color
    
    var displayText: String {
        get {
            switch color {
            case .white:
                return "\u{2658}"
            case .black:
                return "\u{265E}"
            }
        }
    }
    
    func isPossibleInitPosition(with position: Position) -> Bool {
        var isPossible: Bool = false
        
        if position.file == .B || position.file == .G {
            switch color {
            case .white:
                isPossible = position.rank == .eight
            case .black:
                isPossible = position.rank == .one
            }
        }
        
        return isPossible
    }
    
    func getMovablePositions(from position: Position) -> Set<Position> {
        var result: Set<Position?> = []
        
        result.insert(position.makePosition(rankDiff: -2, fileDiff: -1))
        result.insert(position.makePosition(rankDiff: -2, fileDiff: 1))
        result.insert(position.makePosition(rankDiff: -1, fileDiff: -2))
        result.insert(position.makePosition(rankDiff: -1, fileDiff: 2))
        result.insert(position.makePosition(rankDiff: 1, fileDiff: -2))
        result.insert(position.makePosition(rankDiff: 1, fileDiff: 2))
        result.insert(position.makePosition(rankDiff: 2, fileDiff: -1))
        result.insert(position.makePosition(rankDiff: 2, fileDiff: 1))

        result.remove(position)
        return Set(result.compactMap({ $0 }))
    }
}
