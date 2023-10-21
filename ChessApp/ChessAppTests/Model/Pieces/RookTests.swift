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
        let availablePositions = rook.availableMovePositions(for: "D5")
        XCTAssertEqual(availablePositions, [
            "A5", "B5", "C5", "E5", "F5", "G5", "H5",
            "D1", "D2", "D3", "D4", "D6", "D7", "D8"
        ])
    }
    
    func testH8에_있는_검정색_룩의_움직일_수_있는_위치를_확인한다() {
        let rook = Rook(color: .black)
        let availablePositions = rook.availableMovePositions(for: "H8")
        XCTAssertEqual(availablePositions, [
            "A8", "B8", "C8", "D8", "E8", "F8", "G8",
            "H1", "H2", "H3", "H4", "H5", "H6", "H7"
        ])
    }
}
