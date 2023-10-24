//
//  Pawn.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

struct BlackPawn: BlackPiece {
    static let score: Int = 1
    
    func movablePositions(current: Position) -> [Position] {
        return [current.bottomPosition()].compactMap{ $0 }
    }
}

struct WhitePawn: WhitePiece {
    static let score: Int = 1
    
    func movablePositions(current: Position) -> [Position] {
        return [current.topPosition()].compactMap{ $0 }
    }
}

extension BlackPawn: CustomStringConvertible {
    var description: String {
        return "♟"
    }
}

extension WhitePawn: CustomStringConvertible {
    var description: String {
        return "♙"
    }
}
