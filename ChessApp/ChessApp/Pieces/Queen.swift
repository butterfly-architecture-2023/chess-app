//
//  Queen.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Queen: Piece {
    let score: Int = 9
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♛"
        case .white:
            return "♕"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.source != position else {
            return false
        }
        
        return self.canMoveDiagonal(to: position) || self.canMoveStraight(to: position)
    }
    
    private func canMoveDiagonal(to position: Position) -> Bool {
        let distanceOfFile = self.source.file.distance(with: position.file)
        let distanceOfRank = self.source.rank.distance(with: position.rank)
        
        return distanceOfFile == distanceOfRank
    }
    
    private func canMoveStraight(to position: Position) -> Bool {
        return (self.source.file == position.file) || (self.source.rank == position.rank)
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .E, rank: .one)]
        case .white:
            return [Position(file: .E, rank: .eight)]
        }
    }
    
}
