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
        let bottomLeft = current.bottomLeftPosition()
        let topLeft = current.topLeftPosition()
        let bottomRight = current.bottomRightPosition()
        let topRight = current.topRightPosition()
        
        var positions: [Position] = []

        if let topFromTopLeft = topLeft?.topPosition() {
            positions.append(topFromTopLeft)
        }
        
        if let leftFromTopLeft = topLeft?.leftPosition() {
            positions.append(leftFromTopLeft)
        }
        
        if let topFromTopRight = topRight?.topPosition() {
            positions.append(topFromTopRight)
        }
        
        if let rightFromTopRight = topRight?.rightPosition() {
            positions.append(rightFromTopRight)
        }
        
        if let rightFromBottomRight = bottomRight?.rightPosition() {
            positions.append(rightFromBottomRight)
        }
        
        if let bottomFromBottomRight = bottomRight?.bottomPosition() {
            positions.append(bottomFromBottomRight)
        }
        
        if let bottomFromBottomLeft = bottomLeft?.bottomPosition() {
            positions.append(bottomFromBottomLeft)
        }
        
        if let leftFromBottomLeft = bottomLeft?.leftPosition() {
            positions.append(leftFromBottomLeft)
        }
        
        return positions
    }
    
    static func initialPositions() -> [Position: Self] {
        return [Position(file: 1, rank: 0)!: Self.init(),
                Position(file: 6, rank: 0)!: Self.init()]
    }
}

struct WhiteKnight: WhitePiece {
    static let score: Int = 3
    
    func movablePositions(current: Position) -> [Position] {
        let bottomLeft = current.bottomLeftPosition()
        let topLeft = current.topLeftPosition()
        let bottomRight = current.bottomRightPosition()
        let topRight = current.topRightPosition()
        
        var positions: [Position] = []

        if let topFromTopLeft = topLeft?.topPosition() {
            positions.append(topFromTopLeft)
        }
        
        if let leftFromTopLeft = topLeft?.leftPosition() {
            positions.append(leftFromTopLeft)
        }
        
        if let topFromTopRight = topRight?.topPosition() {
            positions.append(topFromTopRight)
        }
        
        if let rightFromTopRight = topRight?.rightPosition() {
            positions.append(rightFromTopRight)
        }
        
        if let rightFromBottomRight = bottomRight?.rightPosition() {
            positions.append(rightFromBottomRight)
        }
        
        if let bottomFromBottomRight = bottomRight?.bottomPosition() {
            positions.append(bottomFromBottomRight)
        }
        
        if let bottomFromBottomLeft = bottomLeft?.bottomPosition() {
            positions.append(bottomFromBottomLeft)
        }
        
        if let leftFromBottomLeft = bottomLeft?.leftPosition() {
            positions.append(leftFromBottomLeft)
        }
        
        return positions
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
