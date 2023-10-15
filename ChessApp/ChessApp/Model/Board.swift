//
//  Board.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

struct Board {
    private(set) var pieces: [Position: Piece] = [:]
    
    init(pieces: [Piece] = Self.initialPieces) {
        let piecePairs = pieces.map { ($0.position, $0) }
        self.pieces = [Position: Piece](uniqueKeysWithValues: piecePairs)
    }
    
    func score(for color: Color) -> Int {
        pieces.values
            .filter { $0.color == color }
            .map {
                switch $0 {
                case is Pawn:
                    return 1
                default:
                    return 0
                }
            }
            .reduce(0, +)
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
        (0..<8).map { i in
            (0..<8).map { j in
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
    
    private func canMove(from: Position, to: Position) -> Bool {
        guard let fromPiece = pieces[from],
                fromPiece.availableMovePositions.contains(to) else { return false }
        guard let toPiece = pieces[to] else { return true }
        return fromPiece.color != toPiece.color
    }
}

extension Board {
    private static var initialPieces: [Piece] {
        (0..<8).flatMap { (i: Int) in
            let file = String(UnicodeScalar(65 + i)!) // "A" + i
            let pawn = { (color: Color, position: String) -> Pawn? in
                guard let position = Position(position) else { return nil }
                return Pawn(color: color, position: position)
            }
            return [
                pawn(.black, "\(file)2"),
                pawn(.white, "\(file)7")
            ].compactMap { $0 }
        }
    }
}
