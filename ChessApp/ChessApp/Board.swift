//
//  Board.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol BoardConfigurable {
    init(inputManager: InputManager, pawnsManager: PawnsManager)
    
    func start()
    func display() -> [[String]]
    func move(userInput: String) throws
    func getScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private(set) var turnColor: Color = .white
    private let pawnsManager: PawnsManager
    private let inputManager: InputManager
    
    init(inputManager: InputManager, pawnsManager: PawnsManager) {
        self.inputManager = inputManager
        self.pawnsManager = pawnsManager
    }
    
    func start() {
        self.pawnsManager.resetPawns()
    }
    
    func display() -> [[String]] {
        var boards = [[String]](repeating: [String](repeating: "", count: File.allCases.count),
                                count: Rank.allCases.count)
        
        for (rankNumber, board) in boards.enumerated() {
            for (fileNumber, _) in board.enumerated() {
                let file = File.allCases[fileNumber]
                let rank = Rank.allCases[rankNumber]

                let text = self.pawnsManager
                    .getPawn(at: Position(file: file, rank: rank))?
                    .text
                
                boards[rankNumber][fileNumber] = text ?? "."
            }
        }

        return boards
    }
    
    func move(userInput: String) throws {
        let inputs = try self.inputManager.makeFormattedInputs(from: userInput)
        try self.validate(inputs: inputs)
        
        self.pawnsManager.update(from: inputs.source, to: inputs.destination)
        self.turnColor = (self.turnColor == .black) ? .white : .black
    }
    
    private func validate(inputs: (source: Position, destination: Position)) throws {
        let source = inputs.source
        let destination = inputs.destination
        
        guard let originPawn = self.pawnsManager.getPawn(at: source) else {
            throw ValidationError.sourceNotExist
        }
        
        guard originPawn.color == self.turnColor else {
            throw ValidationError.invalidTurn
        }
        
        guard originPawn.canMove(to: destination) else {
            throw ValidationError.invalidScope
        }
        
        let pawnOrNilForDestination = self.pawnsManager.getPawn(at: destination)
        guard originPawn.color != pawnOrNilForDestination?.color else {
            throw ValidationError.sameTeam
        }
    }
    
    func getScore(of color: Color) -> Int {
        return self.pawnsManager.getPawns(color: color)
            .map({ $0.score })
            .reduce(0, +)
    }
}
