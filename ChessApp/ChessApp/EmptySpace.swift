//
//  EmptySpace.swift
//  ChessApp
//
//  Created by elly on 11/1/23.
//

import Foundation

class EmptySpace: Piece {
    private(set) var point: Int = 0
    private(set) var pieceColorType: PieceColorType = .white
    
    func showIcon() -> String {
        return "."
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        return [Position(rank: 0, file: 0)]
    }
}
