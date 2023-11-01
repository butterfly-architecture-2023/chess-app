//
//  WhitePieceTests.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/23.
//

import XCTest
@testable import Chess

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
        let position = EmptyPiece(position: Position(rank: .seven, column: .a))
        board.chessMap.setPiece(position)
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhiteRook_이동을_요청하면_성공하는가2() {
        let text = "A8->C8"
        let position1 = Position(rank: .eight, column: .b)
        let position2 = Position(rank: .eight, column: .c)
        board.chessMap.removePiece(position: position1)
        board.chessMap.removePiece(position: position2)
        
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
        let emptyPiece = EmptyPiece(position: Position(rank: .seven, column: .d))
        board.chessMap.setPiece(emptyPiece)
        
        let result = board.movePiece(inputText: text)
        board.display()
        XCTAssertTrue(result)
    }
    
    func test_유효하지_않은_WhiteBishop_이동을_요청하면_실패하는가() {
        let text = "A8->B7"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteQueen_이동이지만_같은색_Piece가_막을때1() {
        let text = "E8->G6"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteQueen_이동이지만_같은색_Piece가_막을때2() {
        let text = "E8->C6"
        let result = board.movePiece(inputText: text)
        XCTAssertFalse(result)
    }
    
    func test_유효한_WhiteQueen_Bishop경로_요청이면_성공하는가1() {
        let text = "E8->G6"
        let position = Position(rank: .seven, column: .f)
        // 경로 상 아군말 제거
        board.chessMap.removePiece(position: position)
        
        let result = board.movePiece(inputText: text)
        XCTAssertTrue(result)
    }
    
    func test_유효한_WhiteQueen_Rook경로_요청이면_성공하는가2() {
        let text = "E8->G6"
        let position = Position(rank: .seven, column: .e)
        // 경로 상 아군말 제거
        board.chessMap.removePiece(position: position)
        
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
