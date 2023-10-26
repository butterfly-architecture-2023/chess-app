//
//  Board.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol BoardConfigurable {
    init(piecesManager: PiecesManagerable)
    
    func display() -> [[String]]
    func move(from source: Position, to destination: Position) throws
    func getScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private(set) var turnColor: Color = .white
    private let piecesManager: PiecesManagerable
    
    init(piecesManager: PiecesManagerable) {
        self.piecesManager = piecesManager
        self.piecesManager.resetPieces()
    }
    
    func display() -> [[String]] {
        var boards = [[String]](repeating: [String](repeating: "", count: File.allCases.count),
                                count: Rank.allCases.count)
        
        for (rankNumber, board) in boards.enumerated() {
            for (fileNumber, _) in board.enumerated() {
                let file = File.allCases[fileNumber]
                let rank = Rank.allCases[rankNumber]

                let text = self.piecesManager.piece(at: Position(file: file, rank: rank))?.text
                boards[rankNumber][fileNumber] = text ?? "."
            }
        }

        return boards
    }
    
    func move(from source: Position, to destination: Position) throws {
        try self.validate(source: source, destination: destination)
        
        self.piecesManager.update(from: source, to: destination)
        self.turnColor = (self.turnColor == .black) ? .white : .black
    }
    
    private func validate(source: Position, destination: Position) throws {
        guard let originPawn = self.piecesManager.piece(at: source) else {
            throw ValidationError.sourceNotExist
        }
        
        guard originPawn.color == self.turnColor else {
            throw ValidationError.invalidTurn
        }
        
        guard originPawn.canMove(to: destination) else {
            throw ValidationError.invalidScope
        }
        
        let pawnOrNilForDestination = self.piecesManager.piece(at: destination)
        guard originPawn.color != pawnOrNilForDestination?.color else {
            throw ValidationError.sameTeam
        }
    }
    
    func getScore(of color: Color) -> Int {
        return self.piecesManager.pieces(color: color)
            .map({ $0.score })
            .reduce(0, +)
    }
}
