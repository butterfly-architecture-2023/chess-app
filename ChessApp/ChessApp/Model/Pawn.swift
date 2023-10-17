//
//  Pawn.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Pawn: Piece {
    static let maxCount: Int = 8
    
    var color: Color
    let score: Int = 1
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

    func canMove(from: Position, to: Position) -> Bool {
        var canMove: Bool = false
        
        let rankDiff = abs(from.rank.rawValue - to.rank.rawValue)
        let fileDiff = abs(from.file.rawValue - to.file.rawValue)
        
        if rankDiff <= 1, fileDiff <= 1 {
            switch color {
            case .white:
                canMove = from.rank.rawValue > to.rank.rawValue
            case .black:
                canMove = from.rank.rawValue < to.rank.rawValue
            }
        }
        
        return canMove
    }
    
}
