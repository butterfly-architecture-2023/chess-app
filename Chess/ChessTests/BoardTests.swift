//
//  BoardTests.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/23.
//

import XCTest
@testable import Chess

final class BoardTest: XCTestCase {
    var board: Board!
    
    override func setUp()  {
        board = Board()
        super.setUp()
    }
    
    override func tearDown() {
        board = nil
    }
    
    func test_Board를_초기화_했을때_체스말이_존재하는가() {
        XCTAssertFalse(board.isEmpty)
    }
    
    func test_Board_초기화후_점수가_동일한가() {
        let initialWhiteScore = board.whiteScore
        let initialBlackScore = board.blackScore
        XCTAssertEqual(initialWhiteScore, initialBlackScore)
    }
    
    func test_유효한_입력값_제공시_WhitePiece값이_nil이_아닌가() {
        let text = "A7->A6"
        let (fromPiece, toPiece) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertNotNil(fromPiece)
        XCTAssertNotNil(toPiece)
    }
    
    func test_유효하지않은_입력값_제공시_Piece값이_nil인가() {
        let text = "A2->33"
        let (fromPiece, toPiece) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertNil(fromPiece)
        XCTAssertNil(toPiece)
    }
    
    func test_화살표를_생략하면_nil을_리턴하는가() {
        let text = "A233"
        let (fromPiece, toPiece) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertNil(fromPiece)
        XCTAssertNil(toPiece)
    }
    
    func test_유효한_입력값_제공시_BlackPiece값이_nil이_아닌가() {
        let text = "A2->A3"
        let (fromPiece, toPiece) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertNotNil(fromPiece)
        XCTAssertNotNil(toPiece)
    }
    
    func test_올바른_입력값을_넣었을떄_WhiteKnight가_존재하는가() {
        let text = "B8->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .knight)
        XCTAssertEqual(fromPiece?.pieceColor, .white)
    }
    
    func test_올바른_입력값을_넣었을떄_WhiteRook가_존재하는가()  {
        let text = "H8->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .rook)
        XCTAssertEqual(fromPiece?.pieceColor, .white)
    }
    
    func test_올바른_입력값을_넣었을떄_WhiteBishop이_존재하는가()  {
        let text = "C8->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .bishop)
        XCTAssertEqual(fromPiece?.pieceColor, .white)
    }
    
    func test_올바른_입력값을_넣었을떄_WhiteQueen이_존재하는가() {
        let text = "E8->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .queen)
        XCTAssertEqual(fromPiece?.pieceColor, .white)
    }
    
    func test_올바른_입력값을_넣었을떄_WhitePawn이_존재하는가()  {
        let text = "H7->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .pawn)
        XCTAssertEqual(fromPiece?.pieceColor, .white)
    }
    
    func test_올바른_입력값을_넣었을떄_BlackKnight가_존재하는가() {
        let text = "B1->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .knight)
        XCTAssertEqual(fromPiece?.pieceColor, .black)
    }
    
    func test_올바른_입력값을_넣었을떄_BlackRook가_존재하는가()  {
        let text = "H1->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .rook)
        XCTAssertEqual(fromPiece?.pieceColor, .black)
    }
    
    func test_올바른_입력값을_넣었을떄_BlackBishop이_존재하는가()  {
        let text = "C1->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .bishop)
        XCTAssertEqual(fromPiece?.pieceColor, .black)
    }
    
    func test_올바른_입력값을_넣었을떄_BlackQueen이_존재하는가() {
        let text = "E1->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .queen)
        XCTAssertEqual(fromPiece?.pieceColor, .black)
    }
    
    func test_올바른_입력값을_넣었을떄_BlackPawn이_존재하는가()  {
        let text = "H2->B3"
        let (fromPiece, _) = board.makeInputPiece(inputText: text) ?? (nil, nil)
        XCTAssertEqual(fromPiece?.pieceType, .pawn)
        XCTAssertEqual(fromPiece?.pieceColor, .black)
    }
    
    func test_White가_이동을_성공한후_Black턴으로_변경되는가() {
        let inputText = "A7->A6"
        _ = board.movePiece(inputText: inputText)
        let initialTurn = board.currentTurn
        XCTAssertEqual(initialTurn, .black)
    }
    
    func test_Black가_이동을_성공한후_White턴으로_변경되는가() {
        let inputText1 = "A7->A6"
        let _ = board.movePiece(inputText: inputText1)
     
        let inputText2 = "B1->A3"
        let _ = board.movePiece(inputText: inputText2)
        let turn = board.currentTurn
        XCTAssertEqual(turn, .white)
    }
}
