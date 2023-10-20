//
//  Position.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class Position {
    var rank: Int // row
    var file: Int // column
    
    init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
    
    convenience init(rank: String, file: String) {
        let rankNumber: Int = Int(rank) ?? 0
        let fileNumber: Int = Int((Character(file).asciiValue ?? 0) - 65)
        self.init(rank: rankNumber, file: fileNumber)
    }
}
