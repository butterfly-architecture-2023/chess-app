//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
    
    let chessBoard = ChessBoard()
    
    let boardInitDisplay =
        """
         ABCDEFGH
        1........
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8........
         ABCDEFGH
        """

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetScoreMethod() throws {
        let initScore = chessBoard.getScore()
        
        XCTAssertEqual(initScore, 16)
    }

    func testChessBoardInit() throws {
        let displayResult = chessBoard.display()
        XCTAssertEqual(boardInitDisplay, displayResult)
    }
    
    // White Pawn을 큰 rank -> 작은 rank 이동
    func testWhitePawnMoveToSmallRank() throws {
        let originPosition = Position(rank: .seven, file: .A)
        let movingPosition = Position(rank: .six, file: .A)
        
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)
        
        let result =
        """
         ABCDEFGH
        1........
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6♙.......
        7.♙♙♙♙♙♙♙
        8........
         ABCDEFGH
        """
        let displayResult = chessBoard.display()
        
        XCTAssertTrue(canMove)
        XCTAssertEqual(result, displayResult)
    }
    
    // White Pawn을 작은 rank -> 큰 rank 이동
    func testWhitePawnMoveToLargeRank() throws {
        let originPosition = Position(rank: .seven, file: .A)
        let movingPosition = Position(rank: .eight, file: .A)
        
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)
        XCTAssertFalse(canMove)
    }
    
    // Black Pawn을 큰 rank -> 작은 rank 이동
    func testBlackPawnMoveToSmallRank() throws {
        let originPosition = Position(rank: .two, file: .C)
        let movingPosition = Position(rank: .one, file: .A)
        
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)
        XCTAssertFalse(canMove)
    }
    
    // Black Pawn을 작은 rank -> 큰 rank 이동
    func testBlackPawnMoveToLargeRank() throws {
        let originPosition = Position(rank: .two, file: .A)
        let movingPosition = Position(rank: .three, file: .A)
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)

        let result =
        """
         ABCDEFGH
        1........
        2.♟♟♟♟♟♟♟
        3♟.......
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8........
         ABCDEFGH
        """
        let displayResult = chessBoard.display()
        
        XCTAssertTrue(canMove)
        XCTAssertEqual(result, displayResult)
    }
    
    // Pawn을 대각선 방향으로 이동
    func testPawnMoveToDiagonal() throws {
        let originPosition = Position(rank: .seven, file: .C)
        let movingPosition = Position(rank: .six, file: .F)
        
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)
        XCTAssertFalse(canMove)
    }
    
    // 같은 색의 Pawn이 위치한 곳으로 이동
    func testPawnAlreadySameColorPawn() throws {
        let originPosition = Position(rank: .seven, file: .C)
        let movingPosition = Position(rank: .seven, file: .D)
        
        let canMove = chessBoard.canMovePiece(from: originPosition, to: movingPosition)
        XCTAssertFalse(canMove)
    }
    
    // 여러번 이동하여 다른 색의 pawn을 잡는 케이스 확인
    func testMultipleMoving() throws {
        let canMove1 = chessBoard.canMovePiece(from: .init(rank: .seven, file: .C), to: .init(rank: .six, file: .C))
        let canMove2 = chessBoard.canMovePiece(from: .init(rank: .six, file: .C), to: .init(rank: .five, file: .C))
        let canMove3 = chessBoard.canMovePiece(from: .init(rank: .two, file: .C), to: .init(rank: .three, file: .C))
        let canMove4 = chessBoard.canMovePiece(from: .init(rank: .five, file: .C), to: .init(rank: .four, file: .C))
        let canMove5 = chessBoard.canMovePiece(from: .init(rank: .three, file: .C), to: .init(rank: .four, file: .C))
        
        XCTAssertTrue(canMove1)
        XCTAssertTrue(canMove2)
        XCTAssertTrue(canMove3)
        XCTAssertTrue(canMove4)
        XCTAssertTrue(canMove5)

        let result =
        """
         ABCDEFGH
        1........
        2♟♟.♟♟♟♟♟
        3........
        4..♟.....
        5........
        6........
        7♙♙.♙♙♙♙♙
        8........
         ABCDEFGH
        """
        let displayResult = chessBoard.display()
        XCTAssertEqual(result, displayResult)

        let score = chessBoard.getScore()
        XCTAssertEqual(score, 15)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
