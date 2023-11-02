//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

protocol Pawn: Piece {
    var onlyCanGoPosition: Position? { get }
}
extension Pawn {
    var point: Int { 1 }
    func getMoveablePositions(pieces: [Piece]) -> [Position] {
        var movablePositions: [Position] = []
        if let onlyCanGoPosition {
            if let isEncounterSameColor = isEncounterSameColorWhenMove(pieces: pieces, moveTo: onlyCanGoPosition) {
                if !isEncounterSameColor {
                    movablePositions.append(onlyCanGoPosition)
                    return movablePositions
                } else {
                    return movablePositions
                }
            }
            movablePositions.append(onlyCanGoPosition)
        }
        return movablePositions
    }
}

struct BlackPawn: Pawn {
    var onlyCanGoPosition: Position? {
        return .init(rankRawValue: position.rank.rawValue + 1,
                     fileRawValue: position.file.rawValue)
    }

    var color: PieceColor = .black // 없애기 가능?
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{265F}"
}

struct WhitePawn: Pawn {
    var onlyCanGoPosition: Position? {
        return .init(rankRawValue: position.rank.rawValue - 1,
                     fileRawValue: position.file.rawValue)
    }
    var color: PieceColor = .white
    var isAlive: Bool = true
    var position: Position
    var icon: String = "\u{2659}"
}
