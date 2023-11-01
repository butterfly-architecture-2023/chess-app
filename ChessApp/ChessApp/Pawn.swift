//
//  Pawn.swift
//  ChessApp
//
//  Created by elly on 11/1/23.
//

import Foundation

class Pawn: Piece {
    var point: Int = 1
    var pieceColorType: PieceColorType
    
    init(pieceColorType: PieceColorType) {
        self.pieceColorType = pieceColorType
    }
    
    func showIcon() -> String {
        return pieceColorType == .black ? "♟" : "♙"
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        print(currentPosition.rank, currentPosition.file)
        return [currentPosition.top(), currentPosition.bottom(),
                currentPosition.left(), currentPosition.right()]
    }
}
