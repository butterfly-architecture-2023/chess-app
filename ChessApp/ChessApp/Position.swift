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
    
    func toString() -> String {
        return String(UnicodeScalar((file + 1) + 64) ?? .init(0)) + String(rank+1)
    }
    
    func top() -> Position {
        return Position(rank: rank - 1, file: file)
    }
    
    func topList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        for _ in 0..<rank {
            array.append(array.last!.top())
        }
        return array
    }
    
    func bottom() -> Position {
        return Position(rank: rank + 1, file: file)
    }
    
    func bottomList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        for _ in 0..<(8-rank) {
            array.append(array.last!.bottom())
        }
        return array
    }
    
    func left() -> Position {
        return Position(rank: rank, file: file - 1)
    }
    
    func leftList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        for _ in 0..<file {
            array.append(array.last!.left())
        }
        return array
    }
    
    func right() -> Position {
        return Position(rank: rank, file: file + 1)
    }
    
    func rightList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        for _ in 0..<(8-file) {
            array.append(array.last!.right())
        }
        return array
    }
    
    func topLeft() -> Position {
        return Position(rank: rank - 1, file: file - 1)
    }
    
    func topLeftList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        let count = (rank < file) ? rank : file
        for _ in 0..<count {
            array.append(array.last!.topLeft())
        }
        return array
    }
    
    func topRight() -> Position {
        return Position(rank: rank - 1, file: file + 1)
    }
    
    func topRightList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        let count = (rank < (8-file)) ? rank : (8-file)
        for _ in 0..<count {
            array.append(array.last!.topRight())
        }
        return array
    }
    
    func bottomLeft() -> Position {
        return Position(rank: rank + 1, file: file - 1)
    }
    
    func bottomLeftList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        let count = ((8-rank) < file) ? (8-rank) : file
        for _ in 0..<count {
            array.append(array.last!.bottomLeft())
        }
        return array
    }
    
    func bottomRight() -> Position {
        return Position(rank: rank + 1, file: file + 1)
    }
    
    func bottomRightList() -> [Position] {
        var array = [Position(rank: rank, file: file)]
        let count = ((8-rank) < (8-file)) ? (8-rank) : (8-file)
        for _ in 0..<count {
            array.append(array.last!.bottomRight())
        }
        return array
    }
    
    func diagonal() -> [Position] {
        return [topLeft(), topRight(), bottomLeft(), bottomRight()]
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
        hasher.combine(file)
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return (lhs.rank == rhs.rank && lhs.file == rhs.file)
    }
}
