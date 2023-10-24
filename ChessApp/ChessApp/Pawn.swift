//
//  Pawn.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol PawnConfigurable {
    var color: Color { get }
    var currentPosition: Position { get }
    var text: String { get }
    
    func canMove(to position: Position) -> Bool
}

struct Pawn: PawnConfigurable {
    let score: Int = 1
    let color: Color
    let currentPosition: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.isSame(file: position.file) else {
            return false
        }

        guard self.canMove(to: position.rank) else {
            return false
        }
        
        return true
    }
    
    private func isSame(file: File) -> Bool {
        return self.currentPosition.file == file
    }
    
    private func canMove(to destinationRank: Rank) -> Bool {
        let currentRank = self.currentPosition.rank
        
        guard currentRank.distance(with: destinationRank) == 1 else {
            return false
        }
        
        switch self.color {
        case .black:
            return currentRank < destinationRank
        case .white:
            return currentRank > destinationRank
        }
    }
}


