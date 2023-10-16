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
    
    convenience init(rank: Character, file: Int) {
        let rankNumber: Int = Int((rank.asciiValue ?? 0) - 65)
        self.init(rank: rankNumber, file: file)
    }
}
