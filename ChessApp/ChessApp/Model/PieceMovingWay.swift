//
//  PieceMovingWay.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct PieceMovingWay: Hashable {
    let rawValue: [Position]
    
    func canMove(to destination: Position, pieces: [Position: Piece]) -> Bool {
        for position in rawValue {
            if position == destination {
                return true
            }
            if pieces[position] != nil {
                // 다른 말이 있는경우
                return false
            }
        }
        // 목적지가 길에 없는 경우
        return false
    }
}

extension PieceMovingWay: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Position...) {
        self.init(rawValue: elements)
    }
}
