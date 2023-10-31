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

    init?(file: Int, rank: Int) {
        guard Position.fileMap.keys.count > file,
              Position.rankMap.keys.count > rank,
              0 <= file,
              0 <= rank else { return nil }
        
        self.file = file
        self.rank = rank
    }
    
    init?(file: Character, rank: Int) {
        guard let file = Position.fileMap[file],
              let rank = Position.rankMap[rank] else { return nil }
        
        self.init(file: file, rank: rank)
    }
    
    func topPosition() -> Self? {
        Position(file: file, rank: rank-1)
    }
    
    func bottomPosition() -> Self? {
        Position(file: file, rank: rank+1)
    }
    
    func leftPosition() -> Self? {
        Position(file: file-1, rank: rank)
    }
    
    func rightPosition() -> Self? {
        Position(file: file+1, rank: rank)
    }

    func topLeftPosition() -> Self? {
        Position(file: file-1, rank: rank-1)
    }
    
    func topRightPosition() -> Self? {
        Position(file: file+1, rank: rank-1)
    }
    
    func bottomRightPosition() -> Self? {
        Position(file: file+1, rank: rank+1)
    }
    
    func bottomLeftPosition() -> Self? {
        Position(file: file-1, rank: rank+1)
    }
    
    func topLeftPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let topLeft = currentPosition?.topLeftPosition() {
            positions.append(topLeft)
            currentPosition = topLeft
        }
        
        return positions
    }
    
    func topRightPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let topRight = currentPosition?.topRightPosition() {
            positions.append(topRight)
            currentPosition = topRight
        }
        
        return positions
    }
    
    func bottomLeftPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let bottomLeft = currentPosition?.bottomLeftPosition() {
            positions.append(bottomLeft)
            currentPosition = bottomLeft
        }
        
        return positions
    }
    
    func bottomRightPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let bottomRight = currentPosition?.bottomRightPosition() {
            positions.append(bottomRight)
            currentPosition = bottomRight
        }
        
        return positions
    }
    
    func topPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let top = currentPosition?.topPosition() {
            positions.append(top)
            currentPosition = top
        }
        
        return positions
    }
    
    func bottomPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let bottom = currentPosition?.bottomPosition() {
            positions.append(bottom)
            currentPosition = bottom
        }
        
        return positions
    }
    
    func leftPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let left = currentPosition?.leftPosition() {
            positions.append(left)
            currentPosition = left
        }
        
        return positions
    }
    
    func rightPositions() -> [Self] {
        var positions: [Self] = []
        var currentPosition: Self? = self
        
        while let right = currentPosition?.rightPosition() {
            positions.append(right)
            currentPosition = right
        }
        
        return positions
    }
}
