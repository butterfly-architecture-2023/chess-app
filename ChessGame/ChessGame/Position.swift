//
//  Position.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/24.
//

import Foundation

struct Position: Equatable, Hashable {
    
    // [입력값: file, rank index]
    static let fileMap: [Character: Int] = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7]
    static let rankMap = [1: 0, 2: 1, 3: 2, 4: 3, 5: 4, 6: 5, 7: 6, 8: 7]
    
    let file: Int     // column
    let rank: Int     // row

    init(file: Int, rank: Int) {        
        self.file = file
        self.rank = rank
    }
    
    init?(file: Character, rank: Int) {
        guard let file = Position.fileMap[file],
              let rank = Position.rankMap[rank] else { return nil }
        
        self.init(file: file, rank: rank)
    }
    
    func topPosition() -> Self? {
        Position(file: file-1, rank: rank)
    }
    
    func bottomPosition() -> Self? {
        Position(file: file+1, rank: rank)
    }

}
