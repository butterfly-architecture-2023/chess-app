//
//  Board.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct ChessBoard {

    struct Square {
        var position: Position
        var piece: Piece?
    }

    private var board: [[Square]] = [[]]
    
    init() {
        board = initBoard()
        startGame()
    }
    
    func getScore() -> Int {
        var score: Int = 0
        
        return score
    }
    
    func display() -> String {
        var result: String = ""
        
        return result
    }
    
    func canMovePiece(from: Position, to: Position) -> Bool {
        var canMove: Bool = false
        return canMove
    }
    
    private func initBoard() -> [[Square]] {
        var board: [[Square]] = .init()
        
        Position.Rank.allCases.forEach { rank in
            var oneRank: [Square] = [Square]()
            Position.File.allCases.forEach { file in
                let square: Square = .init(position: .init(rank: rank, file: file))
                oneRank.append(square)
            }
            board.append(oneRank)
        }
        
        return board
    }
    
    private mutating func startGame() {
        var blackPawns: [Pawn] = .init(repeating: .init(color: .black), count: 8)
        var whitePawns: [Pawn] = .init(repeating: .init(color: .white), count: 8)

        for (rank, oneRank) in board.enumerated() {
            for (file, square) in oneRank.enumerated() {
                
                if square.piece == nil, let availableInitPieceColor = square.position.getInitAvailableColor() {
                    switch availableInitPieceColor {
                    case .black:
                        if let blackPawn = blackPawns.first, blackPawn.isPossibleInitPosition(with: square.position) {
                            board[rank][file].piece = blackPawn
                            blackPawns.removeFirst()
                        }
                    case .white:
                        if let whitePawn = whitePawns.first, whitePawn.isPossibleInitPosition(with: square.position) {
                            board[rank][file].piece = whitePawn
                            whitePawns.removeFirst()
                        }
                    }
                }
            }
        }
    }
}
