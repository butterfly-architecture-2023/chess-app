//
//  BishopTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/20.
//

import XCTest
@testable import ChessApp

final class BishopTests: XCTestCase {
    func testBishop의_점수는_3점이다() {
        let bishop = Bishop(color: .white)
        XCTAssertEqual(bishop.score, 3)
    }
    
    func testD5에_있는_흰색_비숍의_움직일_수_있는_위치를_확인한다() {
        let bishop = Bishop(color: .white)
        let availablePositions = bishop.availableMovingWays(for: "D5")
        XCTAssertEqual(availablePositions, [
            ["C6", "B7", "A8"],
            ["E6", "F7", "G8"],
            ["C4", "B3", "A2"],
            ["E4", "F3", "G2", "H1"]
        ])
    }
    
    func testH8에_있는_검정색_비숍의_움직일_수_있는_위치를_확인한다() {
        let bishop = Bishop(color: .black)
        let availablePositions = bishop.availableMovingWays(for: "H8")
        XCTAssertEqual(availablePositions, [
            ["G7", "F6", "E5", "D4", "C3", "B2", "A1"],
            []
        ])
    }
}
