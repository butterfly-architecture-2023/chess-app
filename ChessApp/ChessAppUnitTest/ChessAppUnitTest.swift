//
//  ChessAppUnitTest.swift
//  ChessAppUnitTest
//
//  Created by elly on 10/17/23.
//

import XCTest

final class ChessAppUnitTest: XCTestCase {
    
    // test 1 - Update Position Mode 입력형식 오류
    func test_입력값_체스말이동_오류() {
        let input = InputManager()
        XCTAssertThrowsError(try input.checkFormatType("A2A->A3")) { error in
            guard case ErrorType.invalidInputText = error else { return XCTFail() }
        }
    }
    
    // test 2 - Update Position Mode 입력형식 통과
    func test_입력값_체스말이동_통과() throws {
        let input = InputManager()
        let regexType = try input.checkFormatType("A2->A3")
        XCTAssertEqual(regexType, .updatePiece)
    }
    
    // test 3 - Help Mode 입력형식 오류
    func test_입력값_도움말_오류() {
        let input = InputManager()
        XCTAssertThrowsError(try input.checkFormatType("!A2")) { error in
            guard case ErrorType.invalidInputText = error else { return XCTFail() }
        }
    }
    
    // test 4 - Help Mode 입력형식 통과
    func test_입력값_도움말_통과() throws {
        let input = InputManager()
        let regexType = try input.checkFormatType("?A2")
        XCTAssertEqual(regexType, .help)
    }
    
    // test 5 - 게임 순서 백색 체스말 먼저 시작 오류
    func test_게임_체스말_순서_백색먼저시작_오류() throws {
        var input = InputManager()
        var board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A2->A3", RegexFormatType.updatePiece)
        XCTAssertThrowsError(try board.checkGameTurn(positionInfo))
    }
    
    // test 6 - 게임 순서 백색 체스말 먼저 시작 통과
    func test_게임_체스말_순서_백색먼저시작_통과() {
        var input = InputManager()
        var board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A7->A6", RegexFormatType.updatePiece)
        XCTAssertNoThrow(try board.checkGameTurn(positionInfo))
    }
    
    // test 7 - 체스말 이동 가능 여부 오류
    func test_이동_가능한지_체크_오류() {
        var input = InputManager()
        let board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A7->B7", RegexFormatType.updatePiece)
        XCTAssertThrowsError(try board.checkMovable(positionInfo, RegexFormatType.updatePiece)) { error in
            guard case ErrorType.unableToMoveError = error else { return XCTFail() }
        }
    }
    
    // test 8 - 체스말 이동 가능 여부 통과
    func test_이동_가능한지_체크_통과() {
        var input = InputManager()
        let board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A7->A6", RegexFormatType.updatePiece)
        XCTAssertNoThrow(try board.checkMovable(positionInfo, RegexFormatType.updatePiece))
    }
      
    // test 9 - Board update 이후 체스말 기존 위치 체크 (empty로 변경)
    func test_체스말_이동_후_현재_위치_업데이트_체크() {
        var input = InputManager()
        var board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A7->A6", RegexFormatType.updatePiece)
        board.updateBoard(positionInfo)
        guard let currentPosition = positionInfo.first else { return }
        XCTAssertTrue(type(of: board.chessBoard[currentPosition]) == EmptySpace.self)
    }
    
    // test 10 - Board update 이후 체스말 업데이트된 위치 체크 (pawn로 변경)
    func test_체스말_이동_후_이동한_위치_업데이트_체크() {
        var input = InputManager()
        var board: Board = Board(size: 8)
        let positionInfo = input.makePositionList("A7->A6", RegexFormatType.updatePiece)
        board.updateBoard(positionInfo)
        guard let updatePosition = positionInfo.last else { return }
        XCTAssertTrue(type(of: board.chessBoard[updatePosition]) == Pawn.self)
    }
}
