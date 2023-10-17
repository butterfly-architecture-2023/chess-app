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
  
  func testPawnShouldntMoves() throws {
    let mockInputs = [
      "A2 A4",
      "A2 A1",
      "B2 A3",
      "B2 C3",
      "B2 A1",
      "B2 C1",
    ]
    
    for i in mockInputs.indices {
      let mock = try board.getCmd(mockInputs[i])
      let result = board.move(from: mock.from, to: mock.to)
      
      XCTAssertEqual(
        board.positions
          .rows(mock.to.row)
          .filter({$0.piece is Pawn})
          .count,
        0)
    }
  }
  
  func testPawnShouldThrowErrorWhenMove() throws {
    let mockThrowable = [
      ("A1 ", Board.InputError.formatError),
      (" B2", Board.InputError.formatError),
      ("A1 B9", Board.InputError.maximumLengthExceeded),
      ("H1 I1", Board.InputError.noRow),
      ("A1 A0", Board.InputError.noRow),
    ]
    
    for i in mockThrowable.indices {
      let mock = try board.getCmd(mockThrowable[i].0)
      
      XCTAssertThrowsError(board.move(from: mock.from, to: mock.to))
    }
  }
}
