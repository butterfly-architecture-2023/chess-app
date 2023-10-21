//
//  Bishop.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/20.
//

import Foundation

struct Bishop: Piece {
    let color: Color
    
    func availableMovingWays(for position: Position) -> Set<PieceMovingWay> {
        [
            availableMovingWay(for: position, fileTransform: -, rankTransform: -),
            availableMovingWay(for: position, fileTransform: -, rankTransform: +),
            availableMovingWay(for: position, fileTransform: +, rankTransform: -),
            availableMovingWay(for: position, fileTransform: +, rankTransform: +)
        ]
    }
    
    private func availableMovingWay(
        for position: Position,
        fileTransform: (Int, Int) -> Int,
        rankTransform: (Int, Int) -> Int) -> PieceMovingWay {
            let positions = (1..<8).compactMap { (stride: Int) -> Position? in
                guard let file = Position.File(fileTransform(position.file.rawValue, stride)),
                      let rank = Position.Rank(rankTransform(position.rank.rawValue, stride)) else {
                    return nil
                }
                return Position(file: file, rank: rank)
            }
            return PieceMovingWay(rawValue: positions)
    }
    
    let maximumCount: Int = 2
    let score: Int = 3
}

extension Bishop: CustomStringConvertible {
    var description: String {
        switch color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
}
