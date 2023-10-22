//
//  QueenTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/22.
//

import XCTest
@testable import ChessApp

final class QueenTests: XCTestCase {
    func testQueen의_점수는_9점이다() {
        XCTAssertEqual(Queen.score, 9)
    }
    
    func testD5에_있는_흰색_퀸의_움직일_수_있는_위치를_확인한다() {
        let queen = Queen(color: .white)
        let availablePositions = queen.availableMovingWays(for: "D5")
        XCTAssertEqual(availablePositions, [
            ["C6", "B7", "A8"],
            ["E6", "F7", "G8"],
            ["C4", "B3", "A2"],
            ["E4", "F3", "G2", "H1"],
            ["C5", "B5", "A5"], ["E5", "F5", "G5", "H5"],
            ["D4", "D3", "D2", "D1"], ["D6", "D7", "D8"]
        ])
    }
    
    func testH8에_있는_검정색_퀸의_움직일_수_있는_위치를_확인한다() {
        let queen = Queen(color: .black)
        let availablePositions = queen.availableMovingWays(for: "H8")
        XCTAssertEqual(availablePositions, [
            ["G7", "F6", "E5", "D4", "C3", "B2", "A1"],
            [],
            ["G8", "F8", "E8", "D8", "C8", "B8", "A8"],
            ["H7", "H6", "H5", "H4", "H3", "H2", "H1"]
        ])
    }
}
