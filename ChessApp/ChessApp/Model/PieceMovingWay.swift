//
//  PieceMovingWay.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

struct PieceMovingWay: Hashable {
    private let rawValue: [Spot]
    
    init(spots: [Spot]) {
        self.rawValue = spots
    }
    
    init(positions: [Position]) {
        self.init(spots: positions.map { Spot(position: $0) })
    }
    
    func canMove(to destination: Position, pieces: [Position: Piece]) -> Bool {
        for spot in rawValue {
            if spot.position == destination {
                return spot.canStop
            }
            if pieces[spot.position] != nil {
                // 가는 길에 다른 말이 있는경우
                return false
            }
        }
        // 목적지가 길에 없는 경우
        return false
    }
}

extension PieceMovingWay {
    struct Spot: Hashable {
        let position: Position
        let canStop: Bool
        
        init(position: Position, canStop: Bool = true) {
            self.position = position
            self.canStop = canStop
        }
    }
}

extension PieceMovingWay: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Position...) {
        self.init(positions: elements)
    }
}
