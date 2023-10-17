//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by 김혜지 on 10/13/23.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
    
    func testPawn_움직일_수_있는_좌표_1개이고_블랙이라서_rank만_1커짐() {
        let board = Board()
        let coordinate: (File, Rank) = (.a, .two)
        let movableCoordinates = board._movableCoordinates(from: coordinate)
        XCTAssertEqual(movableCoordinates.count, 1)
        XCTAssertEqual(movableCoordinates[0].rank, .three)
    }
    
    func testPawn_움직일_수_있는_좌표_1개이고_화이트라서_rank만_1작아짐() {
        let board = Board()
        let coordinate: (File, Rank) = (.a, .seven)
        let movableCoordinates = board._movableCoordinates(from: coordinate)
        XCTAssertEqual(movableCoordinates.count, 1)
        XCTAssertEqual(movableCoordinates[0].rank, .six)
    }
}
