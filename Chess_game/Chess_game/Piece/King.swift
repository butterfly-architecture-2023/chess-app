//
//  King.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//
protocol King: Piece { }
extension King {
    var point: Int { 999999 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var positions: [Position?] = []

        let left = position.getNearPosition(.left)
        let right = position.getNearPosition(.right)
        let bottom = position.getNearPosition(.bottom)
        let top = position.getNearPosition(.top)

        positions.append(left)
        positions.append(right)
        positions.append(bottom)
        positions.append(top)

        return positions.compactMap { $0 }
    }
}


struct BlackKing: King {
    var color: PieceColor = .black
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265A}"
}

struct WhiteKing: King {
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2654}"
}
