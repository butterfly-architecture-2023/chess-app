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
    
    func getMovableAllPositions(from position: Position, with neighborPositions: Set<Position>) -> [[Position]] {
        var result: [[Position]] = .init()
        
        neighborPositions.forEach { startPosition in
            let rankDiff = startPosition.rank.rawValue - position.rank.rawValue
            let fileDiff = startPosition.file.rawValue - position.file.rawValue
            
            var ways: [Position?] = []
            for index in 1..<8 {
                let newRank = rankDiff * index
                let newFile = fileDiff * index
                
                if rankDiff == 0 {
                    ways.append(position.makePosition(rankDiff: 0, fileDiff: newFile))
                } else if fileDiff == 0 {
                    ways.append(position.makePosition(rankDiff: newRank, fileDiff: 0))
                } else {
                    ways.append(position.makePosition(rankDiff: newRank, fileDiff: newFile))
                }
            }
            result.append(ways.compactMap({ $0 }))
        }
        return result
    }
}
