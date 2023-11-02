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
        let blackKingsCount = sut.pieces.values.filter { ($0 as? King)?.color == .black }.count
        let whiteKingsCount = sut.pieces.values.filter { ($0 as? King)?.color == .white }.count

        XCTAssertEqual(blackKingsCount, King(color: .black).maxCount)
        XCTAssertEqual(whiteKingsCount, King(color: .white).maxCount)
    }
}
