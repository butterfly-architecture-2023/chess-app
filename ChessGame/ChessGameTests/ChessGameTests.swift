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
}
