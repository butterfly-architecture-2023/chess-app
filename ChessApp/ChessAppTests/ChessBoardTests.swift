//
//  ChessBoardTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class ChessBoardTests: XCTestCase {
    
    let chessBoard = ChessBoard()
    
    let boardInitDisplay =
        """
         ABCDEFGH
        1♜♞♝.♛♝♞♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChessBoardInit() throws {
        let displayResult = chessBoard.display()
        XCTAssertEqual(boardInitDisplay, displayResult)
    }
    
    // White Pawn을 큰 rank -> 작은 rank 이동
    func testWhitePawnMoveToSmallRank() throws {
        let canMove = try chessBoard.canMove(by: "A7->A6")
        
        let result =
        """
         ABCDEFGH
        1♜♞♝.♛♝♞♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6♙.......
        7.♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """
        let displayResult = chessBoard.display()
        
        XCTAssertTrue(canMove)
        XCTAssertEqual(result, displayResult)
    }
    
    // White Pawn을 작은 rank -> 큰 rank 이동
    func testWhitePawnMoveToLargeRank() throws {
        let canMove = try chessBoard.canMove(by: "A7->A8")
        XCTAssertFalse(canMove)
    }
    
    // Black Pawn을 큰 rank -> 작은 rank 이동
    func testBlackPawnMoveToSmallRank() throws {
        let canMove = try chessBoard.canMove(by: "C2->A1")
        XCTAssertFalse(canMove)
    }
    
    // Black Pawn을 작은 rank -> 큰 rank 이동
    func testBlackPawnMoveToLargeRank() throws {
        let canMove = try chessBoard.canMove(by: "A2->A3")
        let result =
        """
         ABCDEFGH
        1♜♞♝.♛♝♞♜
        2.♟♟♟♟♟♟♟
        3♟.......
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """
        let displayResult = chessBoard.display()
        
        XCTAssertTrue(canMove)
        XCTAssertEqual(result, displayResult)
    }
    
    // Pawn을 대각선 방향으로 이동
    func testPawnMoveToDiagonal() throws {
        let canMove = try chessBoard.canMove(by: "C7->F6")
        XCTAssertFalse(canMove)
    }
    
    // 같은 색의 Pawn이 위치한 곳으로 이동
    func testPawnAlreadySameColorPawn() throws {
        let canMove = try chessBoard.canMove(by: "C7->D7")
        XCTAssertFalse(canMove)
    }
}
