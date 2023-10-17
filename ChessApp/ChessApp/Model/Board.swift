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
    func move(userInput: String) throws
    func display() -> [[String]]
    func getScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private(set) var turnColor: Color = .white
    private var pawnsManager: PawnsManager
    
    init(pawnsManager: PawnsManager) {
        self.pawnsManager = pawnsManager
    }
    
    func start() {
        self.pawnsManager.setupPawns()
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
        
        guard let capital = Capital(input[input.startIndex]),
              let rankNum = Int(String(input[input.index(input.startIndex, offsetBy: 1)])),
              let rank = Rank(rawValue: rankNum) else {
            return nil
        }
        
        return Location(capital: capital, rank: rank)
    }
    
    func display() -> [[String]] {
        var boards = [[String]](repeating: [String](repeating: "", count: Capital.allCases.count),
                                count: Rank.allCases.count)
        
        for (rankNum, board) in boards.enumerated() {
            for (capitalNum, _) in board.enumerated() {
                let capital = Capital.allCases[capitalNum]
                let rank = Rank.allCases[rankNum]

                let pawn = self.pawnsManager.getPawn(at: Location(capital: capital, rank: rank))
                switch pawn?.color {
                case .black:
                    boards[rankNum][capitalNum] = "♟"
                case .white:
                    boards[rankNum][capitalNum] = "♙"
                case .none:
                    boards[rankNum][capitalNum] = "."
                }
            }
        }

        return boards
    }
    
    func getScore(of color: Color) -> Int {
        return self.pawnsManager.getPawns(color: color).count
    }
}
