//
//  Board.swift
//  SwiftChessApp
//
//  Created by Han Songe on 2023/10/18.
//

import Foundation

struct Board {
    private let fileNames: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H"]
    private let size: Int = 8
    
    private var squares: [[Piece?]]
    private var turn: PieceColor = .white
    
    init() {
        self.squares = Array(repeating: Array(repeating: nil, count: size), count: size)
    }
    
    mutating func initializeBoard() {
        setUpPawns(count: size)
    }
    
    func display() -> [[String]] {
        squares.map { ranks in
            ranks.map { piece in
                piece?.symbol ?? "."
            }
        }
    }
    
    func getPiece(at square: ChessSquare) -> Piece? {
        squares[square.rankIndex][square.fileIndex]
    }
}

extension Board {
    mutating private func setUpPawns(count: Int) {
        (0..<count).forEach {
            setUpPawn(color: .black, at: ChessSquare(fileIndex: $0, rankIndex: 1))
            setUpPawn(color: .white, at: ChessSquare(fileIndex: $0, rankIndex: 6))
        }
    }
    
    mutating private func setUpPawn(color: PieceColor, at square: ChessSquare) {
        squares[square.rankIndex][square.fileIndex] = Pawn(color: color)
    }
}

struct ChessSquare {
    let fileIndex: Int
    let rankIndex: Int
}
