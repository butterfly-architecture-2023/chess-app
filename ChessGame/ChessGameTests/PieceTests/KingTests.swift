//
//  KingTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/31/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class KingTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_King_최대_개수_비교() {
        let blackPawnsCount = sut.board.flatMap { $0 }.filter { ($0 as? King)?.color == .black }.count
        let whitePawnsCount = sut.board.flatMap { $0 }.filter { ($0 as? King)?.color == .white }.count

        XCTAssertEqual(blackPawnsCount, King(color: .black).maxCount)
        XCTAssertEqual(whitePawnsCount, King(color: .white).maxCount)
    }
}
