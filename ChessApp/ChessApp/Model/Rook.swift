//
//  Rook.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/23.
//

import Foundation

struct Rook: Piece {
    static let maxCount: Int = 2
    static let score: Int = 5
    
    var color: Color
    
    var displayText: String {
        get {
            switch color {
            case .white:
                return "\u{2656}"
            case .black:
                return "\u{265C}"
            }
        }
    }
    
    func isPossibleInitPosition(with position: Position) -> Bool {
        var isPossible: Bool = false
        
        if position.file == .A || position.file == .H {
            switch color {
            case .white:
                if position.rank == .eight {
                    isPossible = true
                }
            case .black:
                if position.rank == .one {
                    isPossible = true
                }
            }
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
        }
        
        movablePositions.remove(position)
        
        return removeDuplicates(neighbors: neighborPositions, movablePositions: movablePositions)
    }
}
