//
//  QueenTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

import XCTest
@testable import ChessGame

final class QueenTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Queen_최대_개수_비교() {
        let blackQueensCount = sut.board.flatMap { $0 }.filter { ($0 as? Queen)?.color == .black }.count
        let whiteQueensCount = sut.board.flatMap { $0 }.filter { ($0 as? Queen)?.color == .white }.count

        XCTAssertEqual(blackQueensCount, Queen(color: .black).maxCount)
        XCTAssertEqual(whiteQueensCount, Queen(color: .white).maxCount)
    }
}
