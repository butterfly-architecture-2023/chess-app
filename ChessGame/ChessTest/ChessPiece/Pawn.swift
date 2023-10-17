//
//  Pawn.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

struct Pawn {
    var pieceType: PieceType
    let position: Position

    static func initPosition() -> [[Pawn]] {
        var board: [[Pawn]] = []

        for row in 1...8 {
            var rowPieces: [Pawn] = []
            for file in File.allCases {
                rowPieces.append(Pawn(pieceType: .dot, position: Position(rank: row, file: file)))
            }
            board.append(rowPieces)
        }

        return board
    }
}
