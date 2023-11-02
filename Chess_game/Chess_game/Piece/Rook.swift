//
//  Rook.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

protocol Rook: Piece { }
extension Rook {
    var point: Int { 5 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var positions: [Position] = []

        let lefts: [Position] = getMovablePositionsWithDirection(pieces: pieces, .left)
        let rights: [Position] = getMovablePositionsWithDirection(pieces: pieces, .right)
        let bottoms: [Position] = getMovablePositionsWithDirection(pieces: pieces, .bottom)
        let tops: [Position] = getMovablePositionsWithDirection(pieces: pieces, .top)

        positions.append(contentsOf: lefts)
        positions.append(contentsOf: rights)
        positions.append(contentsOf: bottoms)
        positions.append(contentsOf: tops)

        return positions
    }
}

struct BlackRook: Rook {
    var color: PieceColor = .black
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265C}"
}

struct WhiteRook: Rook {
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2656}"
}
