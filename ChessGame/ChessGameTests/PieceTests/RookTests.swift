//
//  RookTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class RookTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Rook_최대_개수_비교() {
        let blackRooksCount = sut.pieces.values.filter { ($0 as? Rook)?.color == .black }.count
        let whiteRooksCount = sut.pieces.values.filter { ($0 as? Rook)?.color == .white }.count

        XCTAssertEqual(blackRooksCount, Rook(color: .black).maxCount)
        XCTAssertEqual(whiteRooksCount, Rook(color: .white).maxCount)
    }
}
