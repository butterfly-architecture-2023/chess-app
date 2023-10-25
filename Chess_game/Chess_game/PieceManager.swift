//
//  PieceManager.swift
//  Chess_game
//
//  Created by 박진섭 on 10/23/23.
//

// PieceManager: 검증(Piece가 움직일 수 있는지, 움직일수 있는 곳은 어디인지)

final class PieceManager {
    private var pieces: [Piece]

    init(_ pieces: [Piece]) {
        self.pieces = pieces
    }

    func move(from startPosition : Position, to destination: Position) -> [Piece]? {
        guard let startPieceIndex = getPieceIndex(with: startPosition) else { return nil }
        if validateCanGo(startPosition, destination) {
            if let destinationPiece = findPiece(destination) {
                if destinationPiece.validateIsDifferentTeam(pieces, startPosition) {
                    kill(destination)
                }
            }
        }
        // 말 포지션을 바꾼다.
        pieces[startPieceIndex].position = destination
        return pieces
    }

    private func getMovablePositions(_ piece: Piece) -> [Position] {
        return piece.getMoveablePositions(pieces: pieces)
    }

    private func getChessPieceIndex(_ position: Position) -> Int? {
        return pieces.firstIndex(where: { $0.position == position })
    }

    private func findPiece(_ position: Position) -> Piece? {
        guard let index = getChessPieceIndex(position) else { return nil }
        return pieces[index]
    }

    private func getPieceIndex(with position: Position) -> Int? {
        return pieces.firstIndex(where: { $0.position == position })
    }

    private func kill(_ position: Position) {
        guard let index = getChessPieceIndex(position) else { return }
        pieces[index].isAlive = false
    }

    private func validateCanGo(_ from: Position, _ to: Position) -> Bool {
        guard let startPiece = findPiece(from) else { return false }
        let moveablePositions = getMovablePositions(startPiece)

        if startPiece.isAlive && moveablePositions.contains(to) {
            return true
        }
        return false
    }

}
