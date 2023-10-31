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
    
    init(for position: Position, fileMultiplier: Int = 0, rankMultiplier: Int = 0, repeat: Int = 8) {
        guard 1<`repeat` else {
            self.init(positions: [])
            return
        }
        let positions = (1..<`repeat`).compactMap { (stride: Int) -> Position? in
            return position.offsetBy(fileOffset: stride * fileMultiplier, rankOffset: stride * rankMultiplier)
        }
        self.init(positions: positions)
    }
    
    func canMovePositions(pieces: [Position: Piece]) -> [Position] {
        rawValue
            .filter { canMove(to: $0.position, pieces: pieces) }
            .map { $0.position }
    }
    
    private func canMove(to destination: Position, pieces: [Position: Piece]) -> Bool {
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
