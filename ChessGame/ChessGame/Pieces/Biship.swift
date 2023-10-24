//
//  Biship.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/25.
//

import Foundation

struct BlackBiship: BlackPiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 0, rank: 2): Self.init(),
                Position(file: 0, rank: 5): Self.init()]
    }
}

struct WhiteBiship: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 7, rank: 2): Self.init(),
                Position(file: 7, rank: 5): Self.init()]
    }
}

extension BlackBiship: CustomStringConvertible {
    var description: String {
        return "♝"
    }
}

extension WhiteBiship: CustomStringConvertible {
    var description: String {
        return "♗"
    }
}
