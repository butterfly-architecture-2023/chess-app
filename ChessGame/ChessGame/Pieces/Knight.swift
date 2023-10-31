//
//  Knight.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

struct BlackKnight: BlackPiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 1, rank: 0)!: Self.init(),
                Position(file: 6, rank: 0)!: Self.init()]
    }
}

struct WhiteKnight: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 1, rank: 7)!: Self.init(),
                Position(file: 6, rank: 7)!: Self.init()]
    }
}

extension BlackKnight: CustomStringConvertible {
    var description: String {
        return "♞"
    }
}

extension WhiteKnight: CustomStringConvertible {
    var description: String {
        return "♘"
    }
}
