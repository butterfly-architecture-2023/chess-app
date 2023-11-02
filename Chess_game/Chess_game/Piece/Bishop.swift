//
//  Bishop.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

protocol Bishop: Piece { }
extension Bishop {
    var point: Int { 3 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var positions: [Position] = []

        let topLeftDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .topLeftDiagonal)
        let topRightDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .topRightDiagonal)
        let bottomLeftDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottomLeftDiagonal)
        let bottomRightDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottomRightDiagonal)

        positions.append(contentsOf: topLeftDiagonals)
        positions.append(contentsOf: topRightDiagonals)
        positions.append(contentsOf: bottomLeftDiagonals)
        positions.append(contentsOf: bottomRightDiagonals)

        return positions
    }
}

struct BlackBishop: Bishop {
    var color: PieceColor = .black
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265D}"
}

struct WhiteBishop: Bishop {
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2657}"
}
