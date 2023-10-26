//
//  Knight.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Knight: Piece {
    let score: Int = 3
    let color: Color
    let currentPosition: Position
    
    var text: String {
        switch color {
        case .black:
            return "♞"
        case .white:
            return "♘"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        let distanceOfFile = self.currentPosition.file.distance(with: position.file)
        let distanceOfRank = self.currentPosition.rank.distance(with: position.rank)
        
        return (distanceOfFile == 2 && distanceOfRank == 1) || (distanceOfFile == 1 && distanceOfRank == 2)
    }
}
