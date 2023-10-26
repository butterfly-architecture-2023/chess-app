//
//  King.swift
//  chessApp
//
//  Created by 현기엽 on 2023/10/26.
//

import Foundation

struct King: Equatable {
    var position: Position
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
  
  mutating func move(rank: Int, file: Int) -> Bool {
    let newPosition = self.position.moved(rank: rank, file: file)
    guard self.availablePositions().contains(newPosition) else {
      return false
    }
    
    self.position = newPosition
    return true
  }
}

enum Color {
    case black
    case white
}

struct Position: Equatable {
    let rank: Int
    let file: Int
    
    func moved(rank: Int, file: Int) -> Position {
        return Position(rank: self.rank + rank, file: self.file + file)
    }
  
    init?(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
}
