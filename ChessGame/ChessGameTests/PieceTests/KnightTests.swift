//
//  KnightTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class KnightTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Knight_최대_개수_비교() {
        let blackKnightsCount = sut.pieces.values.filter { ($0 as? Knight)?.color == .black }.count
        let whiteKnightsCount = sut.pieces.values.filter { ($0 as? Knight)?.color == .white }.count

        XCTAssertEqual(blackKnightsCount, Knight(color: .black).maxCount)
        XCTAssertEqual(whiteKnightsCount, Knight(color: .white).maxCount)
    }
}
