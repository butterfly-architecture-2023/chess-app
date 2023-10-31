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
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 4, rank: 0)!: Self.init()]
    }
}

struct WhiteQueen: WhitePiece {
    static let score: Int = 9
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 4, rank: 7)!: Self.init()]
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
