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
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
    }
}

struct WhiteKnight: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
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
