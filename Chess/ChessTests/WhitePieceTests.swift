//
//  WhitePieceTests.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/23.
//

import XCTest

class WhitePieceTests: XCTestCase {
    var board: Board!
    
    override func setUp()  {
        board = Board()
        super.setUp()
    }
    
    override func tearDown() {
        board = nil
    }
    
    func test_WhitePiece를_해당_Rank보다_높은_곳에_이동을_요청하면_실패하는가() {
        let text = "A8->A9"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }

    func test_WhitePiece를_해당_Rank보다_낮은_곳에_이동을_요청하면_실패하는가() {
        let text = "H7->H6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func testMovePieceInvalid() {
        let inputText = "A2->A4"  // 유효하지 않은 이동 (폰은 처음에 2칸 이동하지 않음)
        // Act
        let result = board.movePiece(inputText: inputText)
        
        // Assert
        XCTAssertFalse(result)
    }
    
    func testCanMovePieceValid() {
        // Arrange
        let fromPiece = Pawn(pieceColor: .white, pieceType: .pawn, position: Position(rank: .seven, column: .a))
        let toPiece = Pawn(pieceColor: .none, pieceType: .none, position: Position(rank: .six, column: .a))
        
        // Act
        let result = board.canMovePiece(fromPiece: fromPiece, toPiece: toPiece)
        
        // Assert
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhitePawn_이동을_요청하면_성공하는가() {
        let text = "A7->A6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhitePawn_이동을_요청하면_실패하는가() {
        let text = "A7->A5"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteRook_이동을_요청하면_성공하는가1() {
        let text = "A8->A6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhiteRook_이동을_요청하면_성공하는가2() {
        let text = "A8->C8"
        board.chessMap[7][2] = EmptyPiece(position: Position(rank: .eight, column: .c))
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhiteRook_이동을_요청하면_실패하는가() {
        let text = "A8->B7"
        let result = board.movePiece(inputText: text)
        // Assert
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteKnight_이동을_요청하면_성공하는가1() {
        let text = "B8->A6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhiteKnight_이동을_요청하면_성공하는가2() {
        let text = "B8->C6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhiteKnight_이동을_요청하면_실패하는가() {
        let text = "A8->B7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteBishop_이동을_요청하면_성공하는가() {
        let text = "C8->D7"
        // 같은 색 말 충돌자리 Empty화
        board.chessMap[6][3] = EmptyPiece(position: Position(rank: .seven, column: .d))
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhiteBishop_이동을_요청하면_실패하는가() {
        let text = "A8->B7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteQueen_이동을_요청하면_성공하는가1() {
        let text = "E8->D8"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhiteQueen_이동을_요청하면_성공하는가2() {
        let text = "E8->C6"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhiteQueen_이동을_요청하면_실패하는가1() {
        let text = "E8->E7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효하지_않은_WhiteQueen_이동을_요청하면_실패하는가2() {
        let text = "E8->D7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
}
