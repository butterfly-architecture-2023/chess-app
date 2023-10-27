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
    static var initialPawns: [Position: Piece] {
        Position.File.range.reduce([:]) { (partialResult: [Position: Piece], i: Int) -> [Position: Piece] in
            guard let file = UnicodeScalar(65 + i) else { // "A" + i
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
    }
}
