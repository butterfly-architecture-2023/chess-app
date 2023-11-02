//
//  PieceManager.swift
//  Chess_game
//
//  Created by 박진섭 on 10/23/23.
//

protocol PieceManager {
    func move(from startPosition : Position, to destination: Position) -> [Piece]
}

final class ChessPieceManager: PieceManager {
    private var pieces: [Piece]

    init(_ pieces: [Piece]) {
        self.pieces = pieces
    }

    func getCurrentTeamScores() -> TeamScore {
        let blackTeamScore = pieces
            .filter { $0.color == .white }
            .filter { $0.isAlive == false }
            .map { $0.point }
            .reduce(0) { $0 + $1}

        let whiteTeamScore = pieces
            .filter { $0.color == .black }
            .filter { $0.isAlive == false }
            .map { $0.point }
            .reduce(0) { $0 + $1}


        return .init(black: blackTeamScore, white: whiteTeamScore)
    }

    func move(from startPosition: Position, to destination: Position) -> [Piece] {
        guard let startPieceIndex = getPieceIndex(with: startPosition) else { return pieces }
        if validateCanGo(from: startPosition, to: destination) {
            if isEncounterDifferentTeam(from: startPosition, to: destination) {
                kill(destination)
            }
            // 말 포지션을 바꾼다.
            pieces[startPieceIndex].position = destination
        }
        return pieces
    }

    private func getMovablePositions(_ piece: Piece) -> [Position] {
        return piece.getMoveablePositions(pieces: pieces)
    }

    private func getChessPieceIndex(_ position: Position) -> Int? {
        return pieces.filter { $0.isAlive }.firstIndex(where: { $0.position == position })
    }

    private func findPiece(at position: Position) -> Piece? {
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

    private func isEncounterDifferentTeam(from startPosition: Position, to destination: Position) -> Bool {
        guard let startPiece = findPiece(at: startPosition),
              let destinationPiece = findPiece(at: destination) else { return false }
        let startPieceColor = startPiece.color
        let destinationPieceColor = destinationPiece.color
        return startPieceColor != destinationPieceColor
    }

    private func validateCanGo(from startPosition: Position, to destination: Position) -> Bool {
        guard let startPiece = findPiece(at: startPosition) else { return false }
        let moveablePositions = getMovablePositions(startPiece)

        if startPiece.isAlive && moveablePositions.contains(destination) {
            return true
        }
        return false
    }
}
