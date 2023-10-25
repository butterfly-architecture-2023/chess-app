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
    let whitePawnInputs = [
      "B7 B6",
      "B6 B5",
      "C7 C6",
      "C6 C5",
      "C5 C4"
    ]
    let blackPawnInputs = [
      "B2 B3",
      "B3 B4",
      "B4 B5",
      "C2 C3",
      "C3 C4"
    ]
    
    for i in blackPawnInputs.indices {
      let blackMoved: Bool, whiteMoved: Bool
      if board.currentTurn == .black {
        let blackMock = try board.getCmd(blackPawnInputs[i])
        blackMoved = try board.move(from: blackMock.from, to: blackMock.to)
        let whiteMock = try board.getCmd(whitePawnInputs[i])
        whiteMoved = try board.move(from: whiteMock.from, to: whiteMock.to)
      } else {
        let whiteMock = try board.getCmd(whitePawnInputs[i])
        whiteMoved = try board.move(from: whiteMock.from, to: whiteMock.to)
        let blackMock = try board.getCmd(blackPawnInputs[i])
        blackMoved = try board.move(from: blackMock.from, to: blackMock.to)
      }
      
      XCTAssertTrue(blackMoved && whiteMoved)
    }
    
    print("testScore", board.score)
    XCTAssertEqual(board.score[.black], 2)
    XCTAssertEqual(board.score[.white], 0)
  }
  
  // 원하는 PieceType 과 통신하고 있는지 이동과 함께 테스트하는 통신 기반 테스트
  func testMovesIntendedPieces() throws {
    print("testMovesIntendedPieces", board.score)
    let blackPawnInputs = [
      "B2 B3",
      "B3 B4",
      "B4 B5", // Black Pawn 제거
    ]
    let blackKnightInputs = [
      "B1 C3",
    ]
    let whitePawnInputs = [
      "B7 B6",
      "B6 B5",
      "C7 C6",
    ]
    let whiteKnightInputs = [
      "C8 A6",
    ]
    
    for i in blackPawnInputs.indices {
      let whiteMock = try board.getCmd(whitePawnInputs[i])
      let blackMock = try board.getCmd(blackPawnInputs[i])
      
      let whiteSUT = board.getPiece(whiteMock.from)
      try board.move(from: whiteMock.from, to: whiteMock.to)
      let blackSUT = board.getPiece(blackMock.from)
      try board.move(from: blackMock.from, to: blackMock.to)
      
      XCTAssertEqual(whiteSUT?.color, .white)
      XCTAssertNotNil(whiteSUT as? Pawn)
      XCTAssertEqual(blackSUT?.color, .black)
      XCTAssertNotNil(blackSUT as? Pawn)
    }
    
    for i in blackKnightInputs.indices {
      let whiteMock = try board.getCmd(whiteKnightInputs[i])
      let blackMock = try board.getCmd(blackKnightInputs[i])
      
      let whiteSUT = board.getPiece(whiteMock.from)
      try board.move(from: whiteMock.from, to: whiteMock.to)
      let blackSUT = board.getPiece(blackMock.from)
      try board.move(from: blackMock.from, to: blackMock.to)
      
      XCTAssertEqual(whiteSUT?.color, .white)
      XCTAssertNotNil(whiteSUT as? Bishop)
      XCTAssertEqual(blackSUT?.color, .black)
      XCTAssertNotNil(blackSUT as? Knight)
    }
  }
}
