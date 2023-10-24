//
//  Piece.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

protocol Piece {
    static var maxCount: Int { get }
    static var score: Int { get }
    var color: Color { get }
    var displayText: String { get }

    func isPossibleInitPosition(with position: Position) -> Bool
    func getMovableAllPositions(from position: Position, with neighborPositions: Set<Position>) -> Set<Position>
}

extension Piece {
    func removeDuplicates(neighbors: Set<Position?>, movablePositions: Set<Position?>) -> Set<Position> {
        var result: Set<Position?> = []
        
        movablePositions.forEach {
            if neighbors.contains($0) {
                result.insert($0)
            }
        }
        
        return Set(result.compactMap({ $0 }))
    }
}
