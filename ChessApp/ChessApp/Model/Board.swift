//
//  Board.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol BoardConfigurable {
    init(pawnsManager: PawnsManager)
    
    func start()
    func display() -> [[String]]
    func move(userInput: String) throws
    func getScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private(set) var turnColor: Color = .white
    private var pawnsManager: PawnsManager
    
    init(pawnsManager: PawnsManager) {
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
                    .getPawn(at: Location(file: file, rank: rank))?
                    .text
                
                boards[rankNumber][fileNumber] = text ?? "."
            }
        }

        return boards
    }
    
    func move(userInput: String) throws {
        let inputs = userInput.split(separator: "->")
        guard let source = self.makeLocation(from: String(inputs[0])),
              let destination = self.makeLocation(from: String(inputs[1])) else {
            
            throw InputError.overRange
        }
                
        guard let originPawn = self.pawnsManager.getPawn(at: source) else {
            throw InputError.sourceNotExist
        }
        
        guard originPawn.color == self.turnColor else {
            throw InputError.invalidTurn
        }
        
        guard originPawn.canMove(to: destination) else {
            throw InputError.invalidScope
        }
        
        let pawnOrNilForDestination = self.pawnsManager.getPawn(at: destination)
        guard originPawn.color != pawnOrNilForDestination?.color else {
            throw InputError.sameTeam
        }
        
        self.pawnsManager.update(originPawn: originPawn, to: destination)
        self.turnColor = (self.turnColor == .black) ? .white : .black
    }
    
    private func makeLocation(from input: String) -> Location? {
        if input.count != 2 {
            return nil
        }
        
        guard let file = File(input[input.startIndex]),
              let rankNum = Int(String(input[input.index(input.startIndex, offsetBy: 1)])),
              let rank = Rank(rawValue: rankNum) else {
            return nil
        }
        
        return Location(file: file, rank: rank)
    }
    
    func getScore(of color: Color) -> Int {
        return self.pawnsManager.getPawns(color: color)
            .map({ $0.score })
            .reduce(0, +)
    }
}
