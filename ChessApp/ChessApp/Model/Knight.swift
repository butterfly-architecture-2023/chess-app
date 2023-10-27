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
    
    func getMovableAllPositions(from position: Position, with neighborPositions: Set<Position>) -> [[Position]] {
        var result: [[Position]] = .init()
        
        if let startPosition = position.makePosition(rankDiff: -1, fileDiff: 0), neighborPositions.contains(startPosition) {
            result.append(([startPosition, position.makePosition(rankDiff: -2, fileDiff: -1)]).compactMap({ $0 }))
            result.append(([startPosition, position.makePosition(rankDiff: -2, fileDiff: 1)]).compactMap({ $0 }))
        }
        
        if let startPosition = position.makePosition(rankDiff: 1, fileDiff: 0), neighborPositions.contains(startPosition) {
            result.append(([startPosition, position.makePosition(rankDiff: 2, fileDiff: -1)]).compactMap({ $0 }))
            result.append(([startPosition, position.makePosition(rankDiff: 2, fileDiff: 1)]).compactMap({ $0 }))
        }
        
        if let startPosition = position.makePosition(rankDiff: 0, fileDiff: -1), neighborPositions.contains(startPosition) {
            result.append(([startPosition, position.makePosition(rankDiff: -1, fileDiff: -2)]).compactMap({ $0 }))
            result.append(([startPosition, position.makePosition(rankDiff: 1, fileDiff: -2)]).compactMap({ $0 }))
        }
        
        if let startPosition = position.makePosition(rankDiff: 0, fileDiff: 1), neighborPositions.contains(startPosition) {
            result.append(([startPosition, position.makePosition(rankDiff: -1, fileDiff: 2)]).compactMap({ $0 }))
            result.append(([startPosition, position.makePosition(rankDiff: 1, fileDiff: 2)]).compactMap({ $0 }))
        }
        
        return result
    }
}
