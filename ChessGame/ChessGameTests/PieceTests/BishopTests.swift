//
//  BishopTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class BishopTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Bishop_최대_개수_비교() {
        let blackBishopsCount = sut.board.flatMap { $0 }.filter { ($0 as? Bishop)?.color == .black }.count
        let whiteBishopsCount = sut.board.flatMap { $0 }.filter { ($0 as? Bishop)?.color == .white }.count

        XCTAssertEqual(blackBishopsCount, Bishop(color: .black).maxCount)
        XCTAssertEqual(whiteBishopsCount, Bishop(color: .white).maxCount)
    }
}
