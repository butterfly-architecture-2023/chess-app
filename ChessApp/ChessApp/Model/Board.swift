//
//  Board.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Board {
    private(set) var pieces: [Position: Piece] = [:]
    
    mutating func updatePieces(_ pieces: [Position: Piece]) throws {
        try validate(pieces: pieces)
        self.pieces = pieces
    }
    
    @discardableResult
    mutating func move(from: Position, to: Position) throws -> Bool {
        try checkMovable(from: from, to: to)
        let hasPieceAtDestination = pieces[to] != nil
        pieces[to] = pieces[from]
        pieces[from] = nil
        return hasPieceAtDestination
    }
    
    func display() -> String {
        Position.Rank.allCases.map { rank in
            Position.File.allCases.map { file in
                guard let piece = pieces[Position(file: file, rank: rank)] else { return "." }
                return piece.description
            }.joined()
        }.joined(separator: "\n")
    }
    
    func score(for color: Color) -> Int {
        pieces.values
            .filter { $0.color == color }
            .map(\.score)
            .reduce(0, +)
    }
    
    private func validate(pieces: [Position: Piece]) throws {
        var classified = [String: Int]()
        for piece in pieces.values {
            let identifier = piece.type + "\(piece.color)"
            let count = classified[identifier, default: 0] + 1
            guard piece.maximumCount >= count else {
                throw BoardValidateError.exceedMaximumCount
            }
            classified[identifier] = count
        }
    }
    
    private func checkMovable(from: Position, to: Position) throws {
        guard let fromPiece = pieces[from],
              fromPiece.availableMovingWays(for: from).contains(where: { $0.canMove(to: to, pieces: pieces) }) == true else { throw BoardMoveError.invalidDestination }
        guard let toPiece = pieces[to] else { return }
        guard fromPiece.color != toPiece.color else { throw BoardMoveError.sameColor }
    }
}
