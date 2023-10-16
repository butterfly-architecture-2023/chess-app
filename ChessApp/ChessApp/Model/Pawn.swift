//
//  Pawn.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Pawn: Piece {

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
    
    func isPossibleInitPosition(with rank: Position.Rank) -> Bool {
        var isPossible: Bool = false
        
        if rank == .two && color == .black {
            isPossible = true
        } else if rank == .seven && color == .white {
            isPossible = true
        }
        
        return isPossible
    }

    func canMoveRank(from: Position.Rank, to: Position.Rank) -> Bool {
        var canMove: Bool = false
        
        let diff = abs(from.rawValue - to.rawValue)
        
        switch color {
        case .white:
            canMove = from.rawValue > to.rawValue && diff == 1
        case .black:
            canMove = from.rawValue < to.rawValue && diff == 1
        }
        
        return canMove
    }

    // file을 이동할 수 있는지
    func canMoveFile(from: Position.File, to: Position.File) -> Bool {
        var canMove: Bool = false
        return canMove
    }

}
