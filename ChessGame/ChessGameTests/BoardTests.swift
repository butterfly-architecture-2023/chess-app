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
    
    func testDisplay_검은_폰_1개_하얀_폰_1개_비어있는_체스판_1곳_일_때_각_유니코드로_변환된_2차원_배열_반환() {
        // 검은 폰 "\u{265F}"
        // 하얀 폰 "\u{2659}"
        // 빈 곳  "\u{002E}"
        let board = Board(square: [[.init(category: .pawn(color: .black)),
                                    .init(category: .pawn(color: .white)),
                                    .init(category: .empty)]])
        let sut = board.display()
        XCTAssertEqual(sut, [["\u{265F}", "\u{2659}", "\u{002E}"]])
    }
}
