//
//  Queen.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//
protocol Queen: Piece { }
extension Queen {
    var point: Int { 9 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var positions: [Position] = []

        let lefts: [Position] = getMovablePositionsWithDirection(pieces: pieces, .left)
        let rights: [Position] = getMovablePositionsWithDirection(pieces: pieces, .right)
        let bottoms: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottom)
        let tops: [Position] = getMovablePositionsWithDirection(pieces: pieces, .top)
        let topLeftDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .topLeftDiagonal)
        let topRightDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .topRightDiagonal)
        let bottomLeftDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottomLeftDiagonal)
        let bottomRightDiagonals: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottomRightDiagonal)
        
        positions.append(contentsOf: lefts)
        positions.append(contentsOf: rights)
        positions.append(contentsOf: bottoms)
        positions.append(contentsOf: tops)
        positions.append(contentsOf: topLeftDiagonals)
        positions.append(contentsOf: topRightDiagonals)
        positions.append(contentsOf: bottomLeftDiagonals)
        positions.append(contentsOf: bottomRightDiagonals)

        return positions
    }
}

struct BlackQueen: Queen {
    var color: PieceColor = .black
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265B}"
}

struct WhiteQueen: Queen {
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2655}"
}
