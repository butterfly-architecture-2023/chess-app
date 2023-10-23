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
    
    func canMove(to position: Position) -> Bool {
        let currentRank = self.currentPosition.rank
        let destinationRank = position.rank
        
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
    
    var text: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
}


