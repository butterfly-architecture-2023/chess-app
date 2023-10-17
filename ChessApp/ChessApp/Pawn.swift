//
//  Pawn.swift
//  ChessApp
//
//  Created by 김혜지 on 10/16/23.
//

struct Pawn: Piece {
    let color: PieceColor
    var icon: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func _movableCoordinates(from coordinate: Board.Coordinate) -> [Board.Coordinate] {
        switch self.color {
        case .black:
            guard let nextRank = Board.Rank(rawValue: coordinate.rank.rawValue + 1) else { return [] }
            return [(coordinate.file, nextRank)]
        case .white:
            guard let nextRank = Board.Rank(rawValue: coordinate.rank.rawValue - 1) else { return [] }
            return [(coordinate.file, nextRank)]
        }
    }
}
