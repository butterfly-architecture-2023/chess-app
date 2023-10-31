//
//  PawnTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class PawnTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Pawn_최대_개수_비교() {
        let blackPawnsCount = sut.pieces.values.filter { ($0 as? Pawn)?.color == .black }.count
        let whitePawnsCount = sut.pieces.values.filter { ($0 as? Pawn)?.color == .white }.count

        XCTAssertEqual(blackPawnsCount, Pawn(color: .black).maxCount)
        XCTAssertEqual(whitePawnsCount, Pawn(color: .white).maxCount)
    }
}
