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
    func getMoveablePositions(pieces: [Piece]) -> [Position]
}

extension Piece {
    func findPiece(pieces: [Piece], with position: Position) -> Piece? {
        guard let index = getPieceIndex(pieces: pieces, with: position) else { return nil }
        return pieces[index]
    }

    func getPieceIndex(pieces: [Piece], with position: Position) -> Int? {
        return pieces.firstIndex(where: { $0.position == position })
    }

    func validateIsDifferentTeam(_ pieces: [Piece], _ with: Position) -> Bool {
        guard let destinationPiece = findPiece(pieces: pieces, with: with) else { return false }
        let startPawnType = self.color
        let destinationPawnType = destinationPiece.color
        return startPawnType != destinationPawnType
    }

}

enum PieceColor: CaseIterable {
    case black
    case white
}
