//
//  Queen.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

struct BlackQueen: BlackPiece {
    static let score: Int = 9
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
    }
}

struct WhiteQueen: WhitePiece {
    static let score: Int = 9
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
    }
}

extension BlackQueen: CustomStringConvertible {
    var description: String {
        return "♛"
    }
}

extension WhiteQueen: CustomStringConvertible {
    var description: String {
        return "♕"
    }
}
