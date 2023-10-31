//
//  Rook.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

struct BlackRook: BlackPiece {
    static let score: Int = 5
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 0, rank: 0)!: Self.init(),
                Position(file: 7, rank: 0)!: Self.init()]
    }
}

struct WhiteRook: WhitePiece {
    static let score: Int = 5
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 0, rank: 7)!: Self.init(),
                Position(file: 7, rank: 7)!: Self.init()]
    }
}

extension BlackRook: CustomStringConvertible {
    var description: String {
        return "♜"
    }
}

extension WhiteRook: CustomStringConvertible {
    var description: String {
        return "♖"
    }
}
