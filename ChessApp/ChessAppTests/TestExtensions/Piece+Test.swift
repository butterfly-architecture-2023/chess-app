//
//  Piece+Test.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/17.
//

import Foundation
@testable import ChessApp
import XCTest

extension [Position: Piece] {
    static var initialPieces: [Position: Piece] {
        Position.File.range.reduce([:]) { (partialResult: [Position: Piece], i: UInt8) -> [Position: Piece] in
            var partialResult = partialResult
            let file = String(UnicodeScalar(65 + i)) // "A" + i
            if let blackPawnPosition = Position("\(file)2") {
                partialResult[blackPawnPosition] = Pawn(color: .black)
            }
            if let whitePawnPosition = Position("\(file)7") {
                partialResult[whitePawnPosition] = Pawn(color: .white)
            }
            return partialResult
        }
    }
}
