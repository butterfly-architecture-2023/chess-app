//
//  Position.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class Position: Hashable {
    var rank: Int // row
    var file: Int // column
    
    init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
    
    convenience init(rank: String, file: String) {
        let rankNumber: Int = (Int(rank) ?? 0) - 1
        let fileNumber: Int = Int((Character(file).asciiValue ?? 0) - 65)
        self.init(rank: rankNumber, file: fileNumber)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
        hasher.combine(file)
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return (lhs.rank == rhs.rank && lhs.file == rhs.file)
    }
}
