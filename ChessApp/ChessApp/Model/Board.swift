//
//  Board.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Board {
    private var grid: [[Position]] = [[Position]]()
    
    init() {
        initGrid()
    }
    
    func getStore() -> Int {
        var store: Int = 0
        
        return store
    }
    
    func display() -> String {
        var result: String = ""
        
        return result
    }
    
    func canMovePiece(from: Position, to: Position) -> Bool {
        var canMove: Bool = false
        return canMove
    }
    
    private mutating func initGrid() {
        Position.Rank.allCases.forEach { rank in
            Position.File.allCases.forEach { file in
                let oneRank: [Position] = .init(repeating: .init(rank: rank, file: file), count: 8)
                grid.append(oneRank)
            }
        }
    }
}
