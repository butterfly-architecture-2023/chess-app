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
    
    static func initialPositions() -> [Position: Self] {
        var positions: [Position: Self] = [:]
         for rank in 0..<8 {
             positions[Position(file: 1, rank: rank)!] = Self.init()
         }
         return positions
    }
}

struct WhitePawn: WhitePiece {
    static let score: Int = 1
    
    func movablePositions(current: Position) -> [Position] {
        return [current.topPosition()].compactMap{ $0 }
    }
    
    static func initialPositions() -> [Position: Self] {
        var positions: [Position: Self] = [:]
         for rank in 0..<8 {
             positions[Position(file: 6, rank: rank)!] = Self.init()
         }
         return positions
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
