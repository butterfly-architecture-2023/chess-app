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
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
    }
}

struct WhiteRook: WhitePiece {
    static let score: Int = 5
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
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
