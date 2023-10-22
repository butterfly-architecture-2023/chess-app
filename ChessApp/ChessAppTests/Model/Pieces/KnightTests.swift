//
//  KnightTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/21.
//

import XCTest
@testable import ChessApp

final class KnightTests: XCTestCase {
    func testKnight의_점수는_3점이다() {
        let knight = Knight(color: .white)
        XCTAssertEqual(knight.score, 3)
    }
    
    func testD5에_있는_흰색_나이트의_움직일_수_있는_위치를_확인한다() {
        let rook = Rook(color: .white)
        let availablePositions = rook.availableMovingWays(for: "D5")
        XCTAssertEqual(availablePositions, [
            ["C5", "B5", "A5"], ["E5", "F5", "G5", "H5"],
            ["D4", "D3", "D2", "D1"], ["D6", "D7", "D8"]
        ])
    }
}
