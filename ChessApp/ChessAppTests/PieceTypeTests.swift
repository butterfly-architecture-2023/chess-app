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
  
  func testBoardStatus() throws {
    let blackAnswers: [(any Piece)?] =
    [Rook(.black), Knight(.black), Bishop(.black), nil, Queen(.black), Bishop(.black), Knight(.black), Rook(.black)] + Array(repeating: Optional.some(Pawn(.black)), count: 8)
    let whiteAnswers: [(any Piece)?] = Array(repeating: Optional.some(Pawn(.white)), count: 8) + [Rook(.white), Knight(.white), Bishop(.white), nil, Queen(.white), Bishop(.white), Knight(.white), Rook(.white)]
    
    for (i, position) in board.blackAreaPositions.enumerated() {
      XCTAssertEqual(blackAnswers[i]?.type, position.piece?.type)
    }
    for (i, position) in board.whiteAreaPositions.enumerated() {
      XCTAssertEqual(whiteAnswers[i]?.type, position.piece?.type)
    }
  }
  
  func testPawnMovesRightDirection() throws {
    let mockInputs = ["A2 A3", "A3 A4", "A4 A5", "A5 A6"]
    
    for i in mockInputs.indices {
      let mock = try board.getCmd(mockInputs[i])
      
      XCTAssertTrue(try board.move(from: mock.from, to: mock.to))
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
      let whiteMoveResult = try board.move(from: whiteMock.from, to: whiteMock.to)
      let blackMock = try board.getCmd(blackInput)
      let blackMoveResult = try board.move(from: blackMock.from, to: blackMock.to)
      
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
        XCTAssertThrowsError(try board.move(from: mock.from, to: mock.to))
      } catch let error {
        XCTAssertEqual(error as? Board.InputError, mockThrowable[i].error)
      }
    }
  }
  
  // 경로 상 다른 체스말이 있을 경우 이동하지 못하는 기능 테스트
  func testPieceShouldntThroughOtherPiece() throws {
    for position in board.positions.rows(.two) {
      position.piece = MockPiece(.white)
    }
    for position in board.positions.rows(.seven) {
      position.piece = MockPiece(.black)
    }
    let whitePawnInputs = [
      "B2 B5"
    ]
    let blackPawnInputs = [
      "B7 B4"
    ]
    
    let whiteInput = whitePawnInputs[0]
    let blackInput = blackPawnInputs[0]
    
    let whiteMock = try board.getCmd(whiteInput)
    let blackMock = try board.getCmd(blackInput)
    
    // TODO: - getNextPosition 을 수정해야 함. 이동거리를 고려하지 않은 메소드이므로 수정 필요.
    XCTAssertTrue(try board.move(from: whiteMock.from, to: whiteMock.to))
    XCTAssertThrowsError(try board.move(from: blackMock.from, to: blackMock.to))
  }
  
  class MockPiece: Piece {
    static func == (lhs: MockPiece, rhs: MockPiece) -> Bool {
      lhs.color == rhs.color
      && lhs.type == rhs.type
      && lhs.directionMovable == rhs.directionMovable
    }
    
    var type: PieceType = .pawn
    var color: PieceColor
    
    var directionMovable: Set<MoveDirection>
    
    required init(_ color: PieceColor) {
      self.color = color
      self.directionMovable = .init(
        color == .black
        ? [.up(3), .upLeft(3), .upRight(3)]
        : [.down(3), .downLeft(3), .downRight(3)]
      )
    }
  }
}
