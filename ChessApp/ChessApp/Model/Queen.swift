//
//  Queen.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/23.
//

import Foundation

struct Queen: Piece {
    static var maxCount: Int = 1
    static var score: Int = 9
    
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
    
    func getMovablePositions(from position: Position) -> Set<Position> {
        var result: Set<Position?> = []
        
        for index in 0..<8 {
            result.insert(position.makePosition(rankDiff: 0, fileDiff: -index))
            result.insert(position.makePosition(rankDiff: 0, fileDiff: index))
            result.insert(position.makePosition(rankDiff: -index, fileDiff: 0))
            result.insert(position.makePosition(rankDiff: index, fileDiff: 0))
            
            result.insert(position.makePosition(rankDiff: index, fileDiff: index))
            result.insert(position.makePosition(rankDiff: index, fileDiff: -index))
            result.insert(position.makePosition(rankDiff: -index, fileDiff: index))
            result.insert(position.makePosition(rankDiff: -index, fileDiff: -index))
        }
        result.remove(position)
        
        return Set(result.compactMap({ $0 }))
    }
}
