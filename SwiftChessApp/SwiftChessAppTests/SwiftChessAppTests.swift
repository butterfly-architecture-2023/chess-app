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
    
    func test_보드생성_display_유니코드() {
        let sampleBoard = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["\u{265F}", "\u{265F}", "\u{265F}", "\u{265F}", "\u{265F}", "\u{265F}", "\u{265F}", "\u{265F}"],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["\u{2659}", "\u{2659}", "\u{2659}", "\u{2659}", "\u{2659}", "\u{2659}", "\u{2659}", "\u{2659}"],
            [".", ".", ".", ".", ".", ".", ".", "."]
        ]
        XCTAssertEqual(sampleBoard, board.display())
    }
    
    func test_보드생성_display_이모지() {
        let sampleBoard = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
            [".", ".", ".", ".", ".", ".", ".", "."]
        ]
        XCTAssertEqual(sampleBoard, board.display())
    }
    
    func test_반대색상() {
        let whitePawn = Pawn(color: .white)
        let oppositeColor = whitePawn.color.getOppositeColor()
        XCTAssertEqual(oppositeColor, .black)
    }
    
    func test_점수계산_흑pawn() {
        let score = board.getNumber(of: Pawn.self, color: .black)
        XCTAssertEqual(score, 8)
    }
    
    func test_점수계산_백pawn() {
        let score = board.getNumber(of: Pawn.self, color: .white)
        XCTAssertEqual(score, 8)
    }
}
