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
    let currentPosition: Position
    
    var text: String {
        switch color {
        case .black:
            return "♛"
        case .white:
            return "♕"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.currentPosition != position else {
            return false
        }
        
        return self.canMoveDiagonal(to: position) || self.canMoveStraight(to: position)
    }
    
    private func canMoveDiagonal(to position: Position) -> Bool {
        let distanceOfFile = self.currentPosition.file.distance(with: position.file)
        let distanceOfRank = self.currentPosition.rank.distance(with: position.rank)
        
        return distanceOfFile == distanceOfRank
    }
    
    private func canMoveStraight(to position: Position) -> Bool {
        return (self.currentPosition.file == position.file) || (self.currentPosition.rank == position.rank)
    }
}
