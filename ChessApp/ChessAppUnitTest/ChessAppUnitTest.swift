//
//  ChessAppUnitTest.swift
//  ChessAppUnitTest
//
//  Created by elly on 10/17/23.
//

import XCTest

final class ChessAppUnitTest: XCTestCase {

    // test 1 - current position 입력형식 적합
    func testValidInputValue() throws {
        var input = InputManager(inputText: "A2->A3")
        XCTAssertNoThrow(try input.checkInputFormat())
    }
    
    // test 2 - current position 입력형식 오류
    func testCurrentPositionInputValue() throws {
        var input = InputManager(inputText: "A2A->A3")
        XCTAssertThrowsError(try input.checkInputFormat()) { error in
            guard case ErrorType.invalidInputText = error else { return XCTFail()}
            if let currentPosition = input.positionInfo.first {
                let rank = currentPosition.rank
                let file = currentPosition.file
                print(rank, file)
                XCTAssertEqual("\(rank)\(file)","02")
            }
        }
    }
    
    // test 3 - update position 입력형식 오류
    func testUpdatePositionInputValue() throws {
        var input = InputManager(inputText: "A2->B33")
        XCTAssertThrowsError(try input.checkInputFormat()) { error in
            guard case ErrorType.invalidInputText = error else { return XCTFail()}
            if let currentPosition = input.positionInfo.first {
                let rank = currentPosition.rank
                let file = currentPosition.file
                print(rank, file)
                XCTAssertEqual("\(rank)\(file)","02")
            }
        }
    }
    
    // test 4 - 체스말 시작 순서 체크
    func testCheckGameTurn() {
        var board = Board(size: 8)
        let input = InputManager(inputText: "A7") // 백색 체스말
        XCTAssertNoThrow(try board.checkGameTurn(input.positionInfo))
    }
    
    // test 5 - Board update 체스말 체크
    func testBoardUpdate() {
        var board = Board(size: 8)
        let positionList = [Position(rank: "2", file: "A"), Position(rank: "3", file: "A")]
        board.updateBoard(positionList)
        print(board.chessBoard)
        XCTAssertEqual(board.chessBoard[1][0], .none)
        XCTAssertEqual(board.chessBoard[2][0], .black)
    }
}
