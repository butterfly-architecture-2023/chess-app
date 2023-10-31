//
//  InitiailBoard.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/31.
//

import Foundation

enum InitialBoard {
    static var pieces: [Position: Piece] {
        let pieces: [Position: Piece] = [
            Position("A1")!: Rook(color: .black),
            Position("B1")!: Knight(color: .black),
            Position("C1")!: Bishop(color: .black),
            Position("E1")!: Queen(color: .black),
            Position("F1")!: Bishop(color: .black),
            Position("G1")!: Knight(color: .black),
            Position("H1")!: Rook(color: .black),
            Position("A8")!: Rook(color: .white),
            Position("B8")!: Knight(color: .white),
            Position("C8")!: Bishop(color: .white),
            Position("E8")!: Queen(color: .white),
            Position("F8")!: Bishop(color: .white),
            Position("G8")!: Knight(color: .white),
            Position("H8")!: Rook(color: .white)
        ]
        let pawns = Position.File.range.reduce([:]) { (partialResult: [Position: Piece], i: Int) -> [Position: Piece] in
                guard let file = UnicodeScalar(AsciiValue.A + i) else {
                    return partialResult
                }
                var partialResult = partialResult
                if let blackPawnPosition = Position("\(file)2") {
                    partialResult[blackPawnPosition] = Pawn(color: .black)
                }
                if let whitePawnPosition = Position("\(file)7") {
                    partialResult[whitePawnPosition] = Pawn(color: .white)
                }
                return partialResult
            }
        return pieces.merging(pawns, uniquingKeysWith: { $1 })
    }
}
