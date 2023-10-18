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
    
    func test_보드생성_흑pawn_초기생성위치() {
        XCTAssertEqual(board.getPiece(at: ChessSquare(fileIndex: 3, rankIndex: 1))?.color, .black)
    }
    
    func test_보드생성_백pawn_초기생성위치() {
        XCTAssertEqual(board.getPiece(at: ChessSquare(fileIndex: 1, rankIndex: 6))?.color, .white)
    }
}
