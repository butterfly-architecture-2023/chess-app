//
//  Queen.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

struct Queen: Piece {
    var color: PieceColor
    var isAlive: Bool = true
    var position: Position

    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        return []
    }
}
