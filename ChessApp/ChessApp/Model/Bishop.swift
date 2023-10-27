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
        func getMovableAllPositions(from position: Position, with neighborPositions: Set<Position>) -> [[Position]] {
        var result: [[Position]] = .init()
        
        let availableStartPosition = neighborPositions.filter({ $0.rank != position.rank && $0.file != position.file })
        
        availableStartPosition.forEach { startPosition in
            let rankDiff = startPosition.rank.rawValue - position.rank.rawValue
            let fileDiff = startPosition.file.rawValue - position.file.rawValue
            
            var ways: [Position?] = []
            for index in 1..<8 {
                let newRank = rankDiff * index
                let newFile = fileDiff * index
                ways.append(position.makePosition(rankDiff: newRank, fileDiff: newFile))
            }
            result.append(ways.compactMap({ $0 }))
        }
        return result
    }
}
