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
    func generateScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private var pawnsManager: PawnsManager
    
    init(pawnsManager: PawnsManager) {
        self.pawnsManager = pawnsManager
    }
    
    func start() {
        self.pawnsManager.setupPawns()
    }
    
    func move(userInput: String) throws {
        
    }
    
    func display() -> [[String]] {
        var boards = [[String]](repeating: [String](repeating: "", count: Capital.allCases.count),
                                count: Rank.allCases.count)
        
        for (rankNum, board) in boards.enumerated() {
            for (capitalNum, _) in board.enumerated() {
                let capital = Capital(index: capitalNum)
                let rank = Rank(index: rankNum)

                let pawn = self.pawnsManager.gatPawn(at: Location(capital: capital, rank: rank))
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
    
    func generateScore(of color: Color) -> Int {
        return self.pawnsManager.getPawns(color: color).count
    }
}
