//
//  SwiftChessAppTests.swift
//  SwiftChessAppTests
//
//  Created by Han Songe on 2023/10/17.
//

import XCTest

final class SwiftChessAppTests: XCTestCase {
    var board: Board!
    let size = 8
    
    override func setUpWithError() throws {
        board = Board()
        board.initializeBoard()
    }
    
    override func tearDownWithError() throws {
        board = nil
    }
}
