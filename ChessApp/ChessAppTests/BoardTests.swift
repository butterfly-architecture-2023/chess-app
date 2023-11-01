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
      "B7 B6", "B6 B5", "C7 C6", "C6 C5", "C5 C4"
    ]
    let blackPawnInputs = [
      "B2 B3", "B3 B4", "B4 B5", "C2 C3", "C3 C4"
    ]
    
    for i in blackPawnInputs.indices {
      if board.currentTurn == .black {
        let blackMock = try board.getCmd(blackPawnInputs[i])
        try board.inputCmd(blackMock.from)
        try board.inputCmd(blackMock.to)
        let whiteMock = try board.getCmd(whitePawnInputs[i])
        try board.inputCmd(whiteMock.from)
        try board.inputCmd(whiteMock.to)
      } else {
        let whiteMock = try board.getCmd(whitePawnInputs[i])
        try board.inputCmd(whiteMock.from)
        try board.inputCmd(whiteMock.to)
        let blackMock = try board.getCmd(blackPawnInputs[i])
        try board.inputCmd(blackMock.from)
        try board.inputCmd(blackMock.to)
      }
    }
    
    print("testScore", board.score)
    XCTAssertEqual(board.score[.black], 0)
    XCTAssertEqual(board.score[.white], 2)
  }
  
  // 원하는 PieceType 과 통신하고 있는지 이동과 함께 테스트하는 통신 기반 테스트
  func testMovesIntendedPieces() throws {
    print("testMovesIntendedPieces", board.score)
    let whitePawnInputs = [
      "B2 B3",
      "B3 B4",
      "B4 B5",
    ]
    let whiteKnightInputs = [
      "B1 C3",
    ]
    let blackPawnInputs = [
      "B7 B6",
      "B6 B5",
      "C7 C6",
    ]
    let blackKnightInputs = [
      "C8 A6",
    ]
    
    for i in blackPawnInputs.indices {
      let whiteMock = try board.getCmd(whitePawnInputs[i])
      let blackMock = try board.getCmd(blackPawnInputs[i])
      
      try board.inputCmd(whiteMock.from)
      try board.inputCmd(whiteMock.to)
      try board.inputCmd(blackMock.from)
      try board.inputCmd(blackMock.to)
      
      let whiteSUT = board.positions[whiteMock.to]?.piece
      let blackSUT = board.positions[blackMock.to]?.piece
      XCTAssertEqual(whiteSUT?.color, .white)
      XCTAssertNotNil(whiteSUT as? Pawn)
      XCTAssertEqual(blackSUT?.color, .black)
      XCTAssertNotNil(blackSUT as? Pawn)
    }
    
    for i in blackKnightInputs.indices {
      let whiteMock = try board.getCmd(whiteKnightInputs[i])
      let blackMock = try board.getCmd(blackKnightInputs[i])
      
      try board.inputCmd(whiteMock.from)
      try board.inputCmd(whiteMock.to)
      try board.inputCmd(blackMock.from)
      try board.inputCmd(blackMock.to)
      
      let whiteSUT = board.positions[whiteMock.to]?.piece
      let blackSUT = board.positions[blackMock.to]?.piece
      XCTAssertEqual(whiteSUT?.color, .white)
      XCTAssertNotNil(whiteSUT as? Knight)
      XCTAssertEqual(blackSUT?.color, .black)
      XCTAssertNotNil(blackSUT as? Bishop)
    }
  }
  
  func testDisplay() throws {
    print(board.display())
  }
}
