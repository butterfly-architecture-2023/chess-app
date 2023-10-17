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
    
    func testBoard_한칸_전진해서_이전좌표에는_피스가_없고_현재좌표에는_피스가_있음() {
        var board = Board()
        let movingResult = board.move(from: (.a, .two), to: (.a, .three))
        let previousSquarePiece = board.squares[.two]![.a] as? Piece
        let currentSquarePiece = board.squares[.three]![.a] as? Piece
        XCTAssertTrue(movingResult)
        XCTAssertNil(previousSquarePiece)
        XCTAssertNotNil(currentSquarePiece)
    }
}
