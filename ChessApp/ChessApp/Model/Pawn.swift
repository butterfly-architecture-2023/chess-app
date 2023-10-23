//
//  Pawn.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Pawn: Piece {
    static let maxCount: Int = 8
    static let score: Int = 1
    
    var color: Color
    var displayText: String {
        get {
            switch color {
            case .white:
                return "\u{2659}"
            case .black:
                return "\u{265F}"
            }
        }
    }
    
    func isPossibleInitPosition(with position: Position) -> Bool {
        var isPossible: Bool = false
        
        if position.rank == .two && color == .black {
            isPossible = true
        } else if position.rank == .seven && color == .white {
            isPossible = true
        }
        
        return isPossible
    }
    
    func getMovablePositions(from position: Position) -> [Position] {
        var result: [Position?] = []
        
        switch color {
        case .white:
            result.append(position.makePosition(rankDiff: -1, fileDiff: 0))
        case .black:
            result.append(position.makePosition(rankDiff: 1, fileDiff: 0))
        }
        
        return result.compactMap({ $0 })
    }
}
