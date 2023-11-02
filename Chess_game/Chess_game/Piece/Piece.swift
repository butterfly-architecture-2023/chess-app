//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

protocol Piece {
    var color: PieceColor { get }
    var isAlive: Bool { get set }
    var position: Position { get set }
    var icon: String { get }
    var point: Int { get }
    func getMoveablePositions(pieces: [Piece]) -> [Position]
}

extension Piece {
    func isEncounterSameColorWhenMove(pieces: [Piece], moveTo destination: Position?) -> Bool? {
        guard let destination = destination else { return nil }
        guard let encounterPiece = pieces.first (where: { $0.position == destination }) else { return nil }
        return encounterPiece.color == self.color
    }

    func getMovablePositionsWithDirection(pieces: [Piece], _ direction: Direction) -> [Position] {
        var positions: [Position] = []
        var position = self.position.getNearPosition(direction)

        while position != nil {
            if let isEncounterPieceColorSame = isEncounterSameColorWhenMove(pieces: pieces, moveTo: position) {
                if isEncounterPieceColorSame {
                    break
                } else {
                    positions.append(position!)
                    break
                }
            }
            positions.append(position!)
            position = position!.getNearPosition(direction)
        }
        return positions
    }
}

enum PieceColor: CaseIterable {
    case black
    case white
}
