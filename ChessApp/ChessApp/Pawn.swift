//
//  Pawn.swift
//  ChessApp
//
//  Created by 김혜지 on 10/16/23.
//

struct Pawn: Piece {
    let color: PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func _movableCoordiantes(currentCoordinate: Board.Coordinate) -> [Board.Coordinate] {
        switch self.color {
        case .black:
            guard let nextRank = Board.Rank(rawValue: currentCoordinate.rank.rawValue + 1) else { return [] }
            return [(currentCoordinate.file, nextRank)]
        case .white:
            guard let nextRank = Board.Rank(rawValue: currentCoordinate.rank.rawValue - 1) else { return [] }
            return [(currentCoordinate.file, nextRank)]
        }
    }
}
