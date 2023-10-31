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
            .map { type(of: $0).score }
            .reduce(0, +)
    }
    
    func canMovePositions(from: Position?) throws -> [Position] {
        guard let from, let piece = pieces[from] else {
            throw BoardMoveError.invalidStartingPoint
        }
        return piece.availableMovingWays(for: from)
            .flatMap { $0.canMovePositions(pieces: pieces) }
            .filter { piece.color != pieces[$0]?.color }
    }
    
    private func validate(pieces: [Position: Piece]) throws {
        var classified = [String: Int]()
        for piece in pieces.values {
            let identifier = piece.type + "\(piece.color)"
            let count = classified[identifier, default: 0] + 1
            guard type(of: piece).maximumCount >= count else {
                throw BoardValidateError.exceedMaximumCount
            }
            classified[identifier] = count
        }
    }
    
    private func checkMovable(from: Position, to: Position) throws {
        guard try canMovePositions(from: from).contains(to) else {
            throw BoardMoveError.invalidDestination
        }
    }
}
