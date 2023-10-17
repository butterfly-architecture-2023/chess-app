//
//  Piece+Test.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/17.
//

import Foundation
@testable import ChessApp
import XCTest

extension Board {
    init(pieces: [Piece]) {
        var board = Board()
        if board.updatePieces(pieces) == false {
            XCTFail("pieces를 update할 수 없음")
        }
        self = board
    }
}

extension [Piece] {
    static var initialPieces: [Piece] {
        Position.File.range.flatMap { (i: UInt8) in
            let file = String(UnicodeScalar(65 + i)) // "A" + i
            let pawn = { (color: Color, position: String) -> Pawn? in
                guard let position = Position(position) else { return nil }
                return Pawn(color: color, position: position)
            }
            return [
                pawn(.black, "\(file)2"),
                pawn(.white, "\(file)7")
            ].compactMap { $0 }
        }
    }
}
