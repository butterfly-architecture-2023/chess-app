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
        let bottomLeft = current.bottomLeftPositions()
        let topLeft = current.topLeftPositions()
        let bottomRight = current.bottomRightPositions()
        let topRight = current.topRightPositions()
        
        return topRight + topLeft + bottomLeft + bottomRight
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 2, rank: 0)!: Self.init(),
                Position(file: 5, rank: 0)!: Self.init()]
    }
}

struct WhiteBiship: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        let bottomLeft = current.bottomLeftPositions()
        let topLeft = current.topLeftPositions()
        let bottomRight = current.bottomRightPositions()
        let topRight = current.topRightPositions()
        
        return topRight + topLeft + bottomLeft + bottomRight
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 2, rank: 7)!: Self.init(),
                Position(file: 5, rank: 7)!: Self.init()]
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
