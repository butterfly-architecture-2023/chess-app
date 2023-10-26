//
//  King.swift
//  chessApp
//
//  Created by 현기엽 on 2023/10/26.
//

import Foundation

struct King: Equatable {
    let position: Position
    let color: Color
    
    func availablePositions() -> [Position] {
        return [
            position.moved(rank: 0, file: 1),
            position.moved(rank: 1, file: 0),
            position.moved(rank: 1, file: 1),
            position.moved(rank: -1, file: 0),
            position.moved(rank: 0, file: -1),
            position.moved(rank: 1, file: -1),
            position.moved(rank: -1, file: -1),
            position.moved(rank: -1, file: 1)
        ]
    }
}

enum Color {
    case black
    case white
}

struct Position: Equatable {
    var rank: Int
    var file: Int
    
    func moved(rank: Int, file: Int) -> Position {
        return Position(rank: self.rank + rank, file: self.file + file)
    }
}
