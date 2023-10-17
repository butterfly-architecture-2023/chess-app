//
//  PieceTypeTests.swift
//  PieceTypeTests
//
//  Created by 백상휘 on 2023/10/15.
//

import XCTest

final class PieceTypeTests: XCTestCase {
  var board = Board()
  
  override func setUp() async throws {
    board = .init()
  }
  
  func testPawnMovesRightDirection() throws {
    let mockInputs = ["A2 A3", "A3 A4", "A4 A5", "A5 A6"]
    
    for i in mockInputs.indices {
      let mock = try board.getCmd(mockInputs[i])
      
      XCTAssertTrue(board.move(from: mock.from, to: mock.to))
      XCTAssertGreaterThanOrEqual(board.positions.rows(mock.to.row).filter({$0.piece is Pawn}).count, 1)
    }
  }
  
  // Board 에서의 이동에 대한 출력 기반 테스트
  func testPawnShouldntMoves() throws {
    let whitePawnInputs = [
      "B2 B1", // Black Pawn 은 위로 이동할 수 없다.
      "B2 A1", // Black Pawn 은 대각선 왼쪽으로 이동할 수 없다.
      "B2 C1", // Black Pawn 은 대각선 오른쪽으로 이동할 수 없다.
      "B2 A2", // Black Pawn 은 왼쪽으로 이동할 수 없다.
      "B2 C2", // Black Pawn 은 오른쪽으로 이동할 수 없다.
    ]
    let blackPawnInputs = [
      "B7 B8", // White Pawn 은 뒤로 이동할 수 없다.
      "B7 A8", // White Pawn 은 대각선 왼쪽으로 이동할 수 없다.
      "B7 C8", // White Pawn 은 대각선 오른쪽으로 이동할 수 없다.
      "B7 A7", // White Pawn 은 왼쪽으로 이동할 수 없다.
      "B7 C7", // White Pawn 은 으론쪽으로 이동할 수 없다.
    ]
    
    for i in blackPawnInputs.indices {
      let whiteInput = whitePawnInputs[i]
      let blackInput = blackPawnInputs[i]
      
      let whiteMock = try board.getCmd(whiteInput)
      let whiteMoveResult = board.move(from: whiteMock.from, to: whiteMock.to)
      let blackMock = try board.getCmd(blackInput)
      let blackMoveResult = board.move(from: blackMock.from, to: blackMock.to)
      
      XCTAssertFalse(whiteMoveResult)
      XCTAssertFalse(blackMoveResult)
    }
  }
  
  // Board 에서의 이동에 대한 출력 기반 테스트
  // Board.Position 에 대한 경계조건을 테스트
  func testPawnShouldThrowErrorWhenMove() throws {
    let mockThrowable: [(input: String, error: Board.InputError)] = [
      ("A1 ", .formatError), // 이상한 입력에 대해 throw 한다.
      (" B2", .formatError), // 이상한 입력에 대해 throw 한다.
      ("A1 B9", .noRow), // 초과하는 Row 는 throw 한다.
      ("H1 I1", .noColumn), // 초과하는 Column 은 throw 한다.
      ("A1 A0", .noRow), // 최소값 아래의 Row 는 throw 한다.
    ]
    
    for i in mockThrowable.indices {
      do {
        let mock = try board.getCmd(mockThrowable[i].input)
        XCTAssertThrowsError(board.move(from: mock.from, to: mock.to))
      } catch let error {
        XCTAssertEqual(error as? Board.InputError, mockThrowable[i].error)
      }
    }
  }
}
