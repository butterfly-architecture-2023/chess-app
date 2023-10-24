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
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
    }
}

struct WhiteBiship: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        []
    }
    
    func movablePositions(currentPosition: (file: Int, rank: Int)) -> [(file: Int, rank: Int)] {
        return []
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
