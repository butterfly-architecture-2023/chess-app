//
//  BlackPieceTests.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/23.
//

import XCTest

class BlackPieceTests: XCTestCase {
    var board: Board!
    
    override func setUp()  {
        board = Board()
        board.currentTurn = .black
        super.setUp()
    }
    
    override func tearDown() {
        board = nil
    }
    
    func test_유효한_BlackPawn_이동을_요청하면_성공하는가() {
        let text = "B2->B3"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_BlackPawn_이동을_요청하면_실패하는가() {
        let text = "B2->B4"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_BlackRook_이동을_요청하면_성공하는가1() {
        let text = "A1->A3"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_BlackRook_이동을_요청하면_성공하는가2() {
        let text = "A1->C1"
        board.chessMap[0][2] = EmptyPiece(position: Position(rank: .one, column: .c))
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_BlackRook_이동을_요청하면_실패하는가() {
        let text = "A8->B7"
        let result = board.movePiece(inputText: text)
        // Assert
        XCTAssertFalse(result)
    }
    
    func test_유효한_BlackKnight_이동을_요청하면_성공하는가1() {
        let text = "B1->A3"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_BlackKnight_이동을_요청하면_성공하는가2() {
        let text = "B1->C3"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_BlackKnight_이동을_요청하면_실패하는가() {
        let text = "B1->B7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_BlackBishop_이동을_요청하면_성공하는가() {
        let text = "C1->D2"
        // 같은 색 말 충돌자리 Empty화
        board.chessMap[1][3] = EmptyPiece(position: Position(rank: .two, column: .d))
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_BlackBishop_이동을_요청하면_실패하는가() {
        let text = "C1->D1"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_BlackQueen_이동을_요청하면_성공하는가1() {
        let text = "E1->D1"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_BlackQueen_이동을_요청하면_성공하는가2() {
        let text = "E1->C3"
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_BlackQueen_이동을_요청하면_실패하는가1() {
        let text = "E1->D3"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효하지_않은_BlackQueen_이동을_요청하면_실패하는가2() {
        let text = "E1->F1"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
}
