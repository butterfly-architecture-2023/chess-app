//
//  Rook.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Rook: Piece {
    let score: Int = 3
    let color: Color
    let currentPosition: Position
    
    var text: String {
        switch color {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.currentPosition != position else {
            return false
        }
        
        return (self.currentPosition.file == position.file) || (self.currentPosition.rank == position.rank)
    }
}
