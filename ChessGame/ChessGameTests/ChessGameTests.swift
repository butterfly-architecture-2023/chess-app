//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/14/23.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_checkInitialPosition() {
        XCTAssertTrue(sut.checkInitialPosition())
    }

    func test_black_movePiece() {
        let from = Pawn(pieceType: .black, position: Position(rank: 2, file: .D))
        let to = Pawn(pieceType: .black, position: Position(rank: 3, file: .E))
        XCTAssertTrue(sut.movePiece(from: from, to: to))
    }

    func test_white_movePiece() {
        let from = Pawn(pieceType: .white, position: Position(rank: 7, file: .D))
        let to = Pawn(pieceType: .white, position: Position(rank: 6, file: .E))
        XCTAssertTrue(sut.movePiece(from: from, to: to))
    }
}
