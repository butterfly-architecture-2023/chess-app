//
//  Bishop.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/23.
//

import Foundation

struct Bishop: Piece {
    static let maxCount: Int = 2
    static let score: Int = 3
    
    var color: Color
    
    var displayText: String {
        get {
            switch color {
            case .white:
                return "\u{2657}"
            case .black:
                return "\u{265D}"
            }
        }
    }
    
    func isPossibleInitPosition(with position: Position) -> Bool {
        var isPossible: Bool = false
        
        if position.file == .C || position.file == .F {
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
    
    func getMovablePositions(from position: Position) -> Set<Position> {
        var result: Set<Position?> = []
                
        for index in 1..<8 {
            result.insert(position.makePosition(rankDiff: index, fileDiff: index))
            result.insert(position.makePosition(rankDiff: index, fileDiff: -index))
            result.insert(position.makePosition(rankDiff: -index, fileDiff: index))
            result.insert(position.makePosition(rankDiff: -index, fileDiff: -index))
        }
        result.remove(position)

        return Set(result.compactMap({ $0 }))
    }
}
