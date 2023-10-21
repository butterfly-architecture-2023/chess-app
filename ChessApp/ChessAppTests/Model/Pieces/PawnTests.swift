//
//  PawnTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class PawnTests: XCTestCase {
    func testA7에_있는_흑색Pawn의_이동가능한_위치는_A8이다() {
        let pawn = Pawn(color: .black)
        XCTAssertEqual(pawn.availableMovingWays(for: "A7"), [["A8"]])
    }
    
    func testA7에_있는_백색Pawn의_이동가능한_위치는_A6이다() {
        let pawn = Pawn(color: .white)
        XCTAssertEqual(pawn.availableMovingWays(for: "A7"), [["A6"]])
    }
    
    func testA8에_있는_흑색Pawn의_이동가능한_위치는_없다() {
        let pawn = Pawn(color: .black)
        XCTAssertEqual(pawn.availableMovingWays(for: "A8"), [])
    }
    
    func testA1에_있는_백색Pawn의_이동가능한_위치는_없다() {
        let pawn = Pawn(color: .white)
        XCTAssertEqual(pawn.availableMovingWays(for: "A1"), [])
    }
    
}
