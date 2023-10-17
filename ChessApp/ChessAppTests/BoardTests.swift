//
//  BoardTests.swift
//  ChessAppTests
//
//  Created by 백상휘 on 2023/10/16.
//

import XCTest

final class BoardTests: XCTestCase {
  var board = Board()
  
  override func setUp() async throws {
    board = .init()
  }
  
  // 점수 상태를 최종 테스트하는 상태 기반 테스트
  func testScores() throws {
    let blackPawnInputs = [
      "B2 B3",
      "B3 B4",
      "B4 B5", // Black Pawn 제거
      "B5 C6", // Black Pawn 제거(대각선 이동)
    ]
    let whitePawnInputs = [
      "B7 B6",
      "B6 B5",
      "C7 C6",
      "D7 C6", // White Pawn 제거
    ]
    
    for i in blackPawnInputs.indices {
      let blackMock = try board.getCmd(blackPawnInputs[i])
      let whiteMock = try board.getCmd(whitePawnInputs[i])
      
      XCTAssertTrue(
        board.move(from: blackMock.from, to: blackMock.to)
        && board.move(from: whiteMock.from, to: whiteMock.to))
    }
    
    XCTAssertEqual(board.score[.black], 1)
    XCTAssertEqual(board.score[.white], 2)
  }
  
  // 원하는 PieceType 과 통신하고 있는지 이동과 함께 테스트하는 통신 기반 테스트
  func testMovesIntendedPieces() throws {
    let blackPawnInputs = [
      "B2 B3",
      "B3 B4",
      "B4 B5", // Black Pawn 제거
      "B5 C6", // Black Pawn 제거(대각선 이동)
    ]
    let whitePawnInputs = [
      "B7 B6",
      "B6 B5",
      "C7 C6",
      "D7 C6", // White Pawn 제거
    ]
    
    for i in blackPawnInputs.indices {
      let whiteMock = try board.getCmd(whitePawnInputs[i])
      let blackMock = try board.getCmd(blackPawnInputs[i])
      
      let whiteSUT = board.getPiece(whiteMock.from)
      board.move(from: whiteMock.from, to: whiteMock.to)
      let blackSUT = board.getPiece(blackMock.from)
      board.move(from: blackMock.from, to: blackMock.to)
      
      XCTAssertEqual(whiteSUT?.color, .white)
      XCTAssertNotNil(whiteSUT as? Pawn)
      XCTAssertEqual(blackSUT?.color, .black)
      XCTAssertNotNil(blackSUT as? Pawn)
    }
  }
}
