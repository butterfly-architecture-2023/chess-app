//
//  Board.swift
//  ChessApp
//
//  Created by Se Eun Lee on 2023/10/18.
//

import Foundation

final class Board {
    private(set) var board: [Position: Piece?] = [:]

    func initPiece(_ color: PieceColor) {
        PieceType.allCases(color).forEach { pieceType in
            pieceType.initPositions.forEach { position in
                board.updateValue(Piece(color, pieceType), forKey: position)
            }
        }
    }

    func getPositionInfo(_ position: Position) -> Piece? {
        return board.first(where: { $0.key == position })?.value
    }

    func canMovePiece(from arrival: Position, to destination: Position) -> Bool {
        guard let piece = getPositionInfo(arrival),
              piece.getMovablePositions(from: arrival).contains(destination) else {
            return false
        }

        if let otherPiece = getPositionInfo(destination), piece.color == otherPiece.color {
            return false
        }

        return true
    }

    func movePiece(from arrival: Position, to destination: Position) {
        guard canMovePiece(from: arrival, to: destination) else {
            return
        }
        board.updateValue(getPositionInfo(arrival), forKey: destination)
        board.removeValue(forKey: arrival)
    }

    func getPieces(_ color: PieceColor) -> [Piece] {
        return board.values.compactMap { $0 }.filter { $0.color == color }
    }

    func getPoint(_ color: PieceColor) -> Int {
        return getPieces(color).reduce(0) { $0 + $1.type.point }
    }

    func display() -> String {
        var result = " "
        File.allCases.forEach { result += $0.rawValue }

        for (rankIdx, rank) in Rank.allCases.enumerated() {
            var rowResult = ""
            for (fileIdx, _) in File.allCases.enumerated() {
                guard let rank = Rank(rawValue: rankIdx + 1),
                      let file = File(fileIdx + 1),
                      let piece = getPositionInfo(Position(rank, file)) else {
                    rowResult += "."
                    continue
                }
                rowResult += piece.type.icon
            }
            result += "\n\(rank.rawValue)\(rowResult)"
        }

        return result
    }
}
