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
    
    func test_인풋문자열_A1_파싱() {
        let inputString = "A1"
        XCTAssertEqual(board.parseSquareName(inputString), ChessSquare(fileIndex: 0, rankIndex: 0))
    }
    
    func test_인풋문자열_D6_파싱() {
        let inputString = "D6"
        XCTAssertEqual(board.parseSquareName(inputString), ChessSquare(fileIndex: 3, rankIndex: 5))
    }
    
    func test_인풋문자열_Z59_파싱() {
        let inputString = "Z59"
        XCTAssertNil(board.parseSquareName(inputString))
    }
    
    func test_체스말이동_백pawn_성공() {
        let A7 = ChessSquare(fileIndex: 0, rankIndex: 6)
        let A6 = ChessSquare(fileIndex: 0, rankIndex: 5)
        XCTAssertTrue(board.movePiece(from: A7, to: A6))
    }
    
    func test_체스말이동_흑pawn_성공() {
        board.switchPlayer()
        let F2 = ChessSquare(fileIndex: 5, rankIndex: 1)
        let F3 = ChessSquare(fileIndex: 5, rankIndex: 2)
        XCTAssertTrue(board.movePiece(from: F2, to: F3))
    }
    
    func test_체스말이동_백pawn_실패() {
        let A7 = ChessSquare(fileIndex: 0, rankIndex: 6)
        let A6 = ChessSquare(fileIndex: 0, rankIndex: 5)
        XCTAssertFalse(board.movePiece(from: A6, to: A7))
    }
    
    func test_체스말이동_흑pawn_실패() {
        board.switchPlayer()
        let F2 = ChessSquare(fileIndex: 5, rankIndex: 1)
        let F3 = ChessSquare(fileIndex: 5, rankIndex: 2)
        XCTAssertFalse(board.movePiece(from: F3, to: F2))
    }
    
    func test_체스말이동_1번_display() {
        let sampleBoard = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["♙", ".", ".", ".", ".", ".", ".", "."],
            [".", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
            [".", ".", ".", ".", ".", ".", ".", "."]
        ]
        let A7 = ChessSquare(fileIndex: 0, rankIndex: 6)
        let A6 = ChessSquare(fileIndex: 0, rankIndex: 5)
        board.movePiece(from: A7, to: A6)
        XCTAssertEqual(sampleBoard, board.display())
    }
    
    func test_체스말이동_2번_display() {
        let sampleBoard = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
            ["♟", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            ["♙", ".", ".", ".", ".", ".", ".", "."],
            [".", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
            [".", ".", ".", ".", ".", ".", ".", "."]
        ]
        let A7 = ChessSquare(fileIndex: 0, rankIndex: 6)
        let A6 = ChessSquare(fileIndex: 0, rankIndex: 5)
        let A2 = ChessSquare(fileIndex: 0, rankIndex: 1)
        let A3 = ChessSquare(fileIndex: 0, rankIndex: 2)
        board.movePiece(from: A7, to: A6)
        board.movePiece(from: A2, to: A3)
        XCTAssertEqual(sampleBoard, board.display())
    }
}
