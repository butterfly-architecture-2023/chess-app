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
        let availablePositions = bishop.availableMovePositions(for: "D5")
        XCTAssertEqual(availablePositions, [
            "A8", "B7", "C6",
            "G8", "F7", "E6",
            "A2", "B3", "C4",
            "H1", "G2", "F3", "E4"
        ])
    }
    
    func testH8에_있는_검정색_비숍의_움직일_수_있는_위치를_확인한다() {
        let bishop = Bishop(color: .black)
        let availablePositions = bishop.availableMovePositions(for: "H8")
        XCTAssertEqual(availablePositions, [
            "A1", "B2", "C3", "D4", "E5", "F6", "G7"
        ])
    }
}
