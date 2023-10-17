//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/18.
//

import XCTest
@testable import ChessGame

import XCTest

final class BoardTests: XCTestCase {

    func testHasPieces_체스말_존재_시_TRUE_반환() {
        let board = Board(square: [[.init(category: .pawn(color: .black))]])
        XCTAssertTrue(board.hasPieces)
    }
    
    func testHasPieces_체스말_미존재_시_FALSE_반환() {
        let board = Board(square: [[.init(category: .empty)]])
        XCTAssertFalse(board.hasPieces)
    }

    
    func testScore_검은_폰_1개_하얀_폰_2개_존재_시_각_1점_2점_반환() {
        let board = Board(square: [[.init(category: .pawn(color: .black)),
                                    .init(category: .pawn(color: .white)),
                                    .init(category: .pawn(color: .white))]])
        let sut = board.score() == (1, 2)
        XCTAssertTrue(sut)
    }
}
