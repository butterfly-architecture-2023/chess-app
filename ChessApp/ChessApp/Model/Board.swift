//
//  Board.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Board {
    private(set) var pieces: [Position: Piece] = [:]
    
    mutating func updatePieces(_ pieces: [Piece]) -> Bool {
        guard validate(pieces: pieces) else { return false }
        let piecePairs = pieces.map { ($0.position, $0) }
        self.pieces = [Position: Piece](uniqueKeysWithValues: piecePairs)
        return true
    }
    
    mutating func move(from: Position, to: Position) -> Bool {
        guard canMove(from: from, to: to) else {
            return false
        }
        
        pieces[to] = pieces[from]
        pieces[from] = nil
        return true
    }
    
    func display() -> String {
        Position.Rank.range.map { i in
            Position.File.range.map { j in
                guard let rank = Position.Rank(UInt8(i)),
                      let file = Position.File(UInt8(j)),
                      let piece = pieces[Position(file: file, rank: rank)] else { return "." }
                switch piece {
                case is Pawn:
                    return piece.color == .black ? "♟" : "♙"
                default:
                    return "."
                }
            }.joined()
        }.joined(separator: "\n")
    }
    
    func score(for color: Color) -> Int {
        pieces.values
            .filter { $0.color == color }
            .map(\.score)
            .reduce(0, +)
    }
    
    private func validate(pieces: [Piece]) -> Bool {
        var classified = [String: Int]()
        for piece in pieces {
            let identifier = piece.type + "\(piece.color)"
            let count = classified[identifier, default: 0] + 1
            guard piece.maximumCount >= count else {
                return false
            }
            classified[identifier] = count
        }
        return true
    }
    
    private func canMove(from: Position, to: Position) -> Bool {
        guard let fromPiece = pieces[from],
                fromPiece.availableMovePositions.contains(to) else { return false }
        guard let toPiece = pieces[to] else { return true }
        return fromPiece.color != toPiece.color
    }
}
