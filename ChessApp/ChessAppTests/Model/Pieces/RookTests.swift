//
//  RookTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/21.
//

import XCTest
@testable import ChessApp

final class RookTests: XCTestCase {
    func testRook의_점수는_5점이다() {
        let rook = Rook(color: .white)
        XCTAssertEqual(rook.score, 5)
    }
    
    func testD5에_있는_흰색_룩의_움직일_수_있는_위치를_확인한다() {
        let rook = Rook(color: .white)
        let availablePositions = rook.availableMovingWays(for: "D5")
        XCTAssertEqual(availablePositions, [
            ["C5", "B5", "A5"], ["E5", "F5", "G5", "H5"],
            ["D4", "D3", "D2", "D1"], ["D6", "D7", "D8"]
        ])
    }
    
    func testH8에_있는_검정색_룩의_움직일_수_있는_위치를_확인한다() {
        let rook = Rook(color: .black)
        let availablePositions = rook.availableMovingWays(for: "H8")
        XCTAssertEqual(availablePositions, [
            [],
            [],
            ["G8", "F8", "E8", "D8", "C8", "B8", "A8"],
            ["H7", "H6", "H5", "H4", "H3", "H2", "H1"]
        ])
    }
}
