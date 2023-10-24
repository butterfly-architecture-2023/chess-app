//
//  Queen.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/23.
//

import Foundation

struct Queen: Piece {
    static let maxCount: Int = 1
    static let score: Int = 9
    
    var color: Color
    
    var displayText: String {
        get {
            switch color {
            case .white:
                return "\u{2655}"
            case .black:
                return "\u{265B}"
            }
        }
    }
    
    func isPossibleInitPosition(with position: Position) -> Bool {
        var isPossible: Bool = false
        
        switch color {
        case .white:
            isPossible = position.rank == .eight && position.file == .E
        case .black:
            isPossible = position.rank == .one && position.file == .E
        }
        
        return isPossible
    }
    
    func getMovableAllPositions(from position: Position, with neighborPositions: Set<Position>) -> Set<Position> {
        var movablePositions: Set<Position?> = []
        
        for index in 0..<8 {
            movablePositions.insert(position.makePosition(rankDiff: 0, fileDiff: -index))
            movablePositions.insert(position.makePosition(rankDiff: 0, fileDiff: index))
            movablePositions.insert(position.makePosition(rankDiff: -index, fileDiff: 0))
            movablePositions.insert(position.makePosition(rankDiff: index, fileDiff: 0))
            
            movablePositions.insert(position.makePosition(rankDiff: index, fileDiff: index))
            movablePositions.insert(position.makePosition(rankDiff: index, fileDiff: -index))
            movablePositions.insert(position.makePosition(rankDiff: -index, fileDiff: index))
            movablePositions.insert(position.makePosition(rankDiff: -index, fileDiff: -index))
        }
        movablePositions.remove(position)
        
        return removeDuplicates(neighbors: neighborPositions, movablePositions: movablePositions)
    }
}
