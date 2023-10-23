//
//  Board.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation
import Combine

class Board {
  let positions = [Position].boardGrid
  var blackAreaPositions: [Position] {
    positions.rows(.one) + positions.rows(.two)
  }
  var whiteAreaPositions: [Position] {
    positions.rows(.seven) + positions.rows(.eight)
  }
  var currentTurn: PieceColor = .white
  var score: [PieceColor: Int] = [
    .black: 0,
    .white: 0
  ]
  
  init() {
    let blackComb = specialChessCombination(.black)
    positions.rows(.one).enumerated().forEach { (inx, position) in
      position.piece = blackComb[inx]
    }
    positions.rows(.two).forEach({ $0.piece = Pawn(.black) })
    
    positions.rows(.seven).forEach({ $0.piece = Pawn(.white) })
    let whiteComb = specialChessCombination(.white)
    positions.rows(.eight).enumerated().forEach { (inx, position) in
      position.piece = whiteComb[inx]
    }
  }
  
  // movePiece, calculate 호출
  @discardableResult
  func move(from start: Position, to dest: Position) -> Bool {
    let (result, sideEffect) = movePiece(from: start, to: dest)
    if sideEffect != nil {
      calculate()
    }
    
    currentTurn = currentTurn == .white ? .black : .white
    
    return result
  }
  
  /// positions 일부의 체스말 상태를 바꾸는 Side-Effect 존재. 이동 성공여부를 반환한다.
  private func movePiece(
    from start: Position,
    to dest: Position
  ) -> (result: Bool, sideEffect: (any Piece)?) {
    // 기존에 subscript 로 Piece 를 가져오던 것을 getPiece 로 변경
    // 테스트 코드에서 Position 에 대해 원하는 PieceType 을 접근하는지 접근하기 위한 테스트
    guard let startPiece = getPiece(start) else {
      return (false, nil)
    }
    
    guard let directionToMove = start.direction(to: dest),
          startPiece.directionMovable.contains(directionToMove),
          getExistsPieces(from: start, to: directionToMove).isEmpty
    else {
      return (false, nil)
    }
    
    guard let destPiece = getPiece(dest) else {
      positions[start]?.piece = nil
      positions[dest]?.piece = startPiece
      return (true, nil)
    }
    
    if destPiece.color == startPiece.color {
      return (false, nil)
    } else {
      positions[start]?.piece = nil
      positions[dest]?.piece = startPiece
      return (true, destPiece)
    }
  }
  
  // 점수를 수정하는 Side-Effect 존재
  private func calculate() {
    score[currentTurn] = ((score[currentTurn] ?? 0) + 1)
  }
  
  class Position: Equatable, Hashable {
    static func == (lhs: Board.Position, rhs: Board.Position) -> Bool {
      lhs.row == rhs.row && lhs.column == rhs.column
    }
    
    let row: Row, column: Column
    
    var piece: (any Piece)?
    
    init(_ column: Column, _ row: Row) {
      self.row = row; self.column = column
    }
    
    init?(_ column: String, _ row: Int) {
      guard
        let row = row.toRow,
        let column = column.toColumn
      else {
        return nil
      }
      
      self.row = row; self.column = column
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(row)
      hasher.combine(column)
    }
  }
  
  func getCmd(_ cmd: String) throws -> (from: Position, to: Position) {
    let cmds = cmd.split(separator: " ").map({String($0)})
    
    guard cmds.count == 2 else {
      throw InputError.formatError
    }
    
    return try (from: getPosition(from: cmds[0]), to: getPosition(from: cmds[1]))
  }
  
  func getPiece(_ position: Position) -> (any Piece)? {
    return positions[position]?.piece
  }
  
  /// 도착지점을 제외하고 경로 상에 있는 모든 체스말들을 반환합니다.
  func getExistsPieces(from position: Position, to direction: MoveDirection) -> [(any Piece)] {
    var position = position
    let distance = (direction.distance ?? 0)-1
    var result = [(any Piece)]()
    
    guard distance >= 0 else {
      return result
    }
    
    for _ in 0..<distance {
      if let next = position.getNextPosition(to: direction) {
        position = next
        
        if let piece = getPiece(next) {
          result.append(piece)
        }
      }
    }
    
    return result
  }
  
  private func getPosition(from input: String) throws -> Position {
    guard input.count == 2 else {
      throw { () -> InputError in
        input.count < 2 ? .minimumLengthViolated : .maximumLengthExceeded
      }()
    }
    
    guard let column = input.getColumn,
          let row = input.getRow else {
      throw { () -> InputError in
        input.getColumn == nil ? .noColumn : .noRow
      }()
    }
    
    return Position(column, row)
  }
  
  private func specialChessCombination(_ color: PieceColor) -> [(any Piece)?] {
    [
      Rook(color), Knight(color), Bishop(color),
      nil,
      Queen(color), Bishop(color), Knight(color), Rook(color)
    ]
  }
  
  enum InputError: Error {
    case maximumLengthExceeded, minimumLengthViolated, formatError, noColumn, noRow
  }
}

extension Array where Element == Board.Position {
  static var boardGrid: Self = [
    .init("A",1),.init("A",2),.init("A",3),.init("A",4),.init("A",5),.init("A",6),.init("A",7),.init("A",8),
    .init("B",1),.init("B",2),.init("B",3),.init("B",4),.init("B",5),.init("B",6),.init("B",7),.init("B",8),
    .init("C",1),.init("C",2),.init("C",3),.init("C",4),.init("C",5),.init("C",6),.init("C",7),.init("C",8),
    .init("D",1),.init("D",2),.init("D",3),.init("D",4),.init("D",5),.init("D",6),.init("D",7),.init("D",8),
    .init("E",1),.init("E",2),.init("E",3),.init("E",4),.init("E",5),.init("E",6),.init("E",7),.init("E",8),
    .init("F",1),.init("F",2),.init("F",3),.init("F",4),.init("F",5),.init("F",6),.init("F",7),.init("F",8),
    .init("G",1),.init("G",2),.init("G",3),.init("G",4),.init("G",5),.init("G",6),.init("G",7),.init("G",8),
    .init("H",1),.init("H",2),.init("H",3),.init("H",4),.init("H",5),.init("H",6),.init("H",7),.init("H",8)
  ].compactMap({$0})
  
  func rows(_ row: Row) -> Self {
    self.filter({$0.row == row})
  }
  
  func columns(_ column: Column) -> Self {
    self.filter({$0.column == column})
  }
  
  subscript(position: Board.Position) -> Board.Position? {
    get {
      self.first(where: {$0 == position})
    }
  }
}

extension Board.Position {
  func distance(to position: Board.Position) -> Int {
    if self.row != position.row {
      return abs(row.rawValue - position.row.rawValue)
    } else {
      return abs(column.order - position.column.order)
    }
  }
  
  func direction(to position: Board.Position) -> MoveDirection? {
    guard position != self else {
      return nil
    }
    
    let distance = distance(to: position)
    
    if row == position.row { // 왼쪽 오른쪽
      return (column < position.column) ? .right(distance) : .left(distance)
    } else { // 대각선, 위 아래
      if column == position.column { // 위 아래
        return self.row < position.row ? .down(distance) : .up(distance)
      } else {
        if row > position.row && column > position.column {
          return .upRight(distance)
        } else if row > position.row && column < position.column {
          return .upLeft(distance)
        } else if row < position.row && column > position.column {
          return .downLeft(distance)
        } else if row < position.row && column < position.column {
          return .downRight(distance)
        } else {
          return nil
        }
      }
    }
  }
  
  func getNextPosition(to direction: MoveDirection) -> Board.Position? {
    // 이동하는 거리는 고려하지 않음. 다음 칸은 무조건 한칸이므로 Int 값 불필요
    switch direction {
    case .up(_), .upRight(_), .upLeft(_), .downLeft(_), .downRight(_), .down(_):
      let columnDistance: Int = {
        switch direction {
        case .downRight(_), .upRight(_): return 1 // 오른쪽으로 가므로 +1
        case .downLeft(_), .upLeft(_): return -1 // 왼쪽으로 가므로 -1
        default: return 0
        }
      }()
      let rowDistance: Int = {
        switch direction {
        case .downRight(_), .downLeft(_), .down(_): return 1 // 내려가므로 +1
        case .upRight(_), .upLeft(_), .up(_): return -1 // 올라가므로 -1
        default: return 0
        }
      }()
      
      let newRow = self.row.rawValue + rowDistance
      let newColumn = self.column.order + columnDistance
      
      guard newRow >= 1, newColumn >= 0,
            let destRow = newRow.toRow,
            let destColumn = newColumn.toColumn else {
        return nil
      }
      
      return Board.Position(destColumn, destRow)
    case .left(_), .right(_):
      let distance: Int = {
        switch direction {
        case .right(_): return 1
        case .left(_): return -1
        default: return 0
        }
      }()
      let newColumn = self.column.order + distance
      guard newColumn >= 0, let destColumn = newColumn.toColumn else {
        return nil
      }
      
      return Board.Position(destColumn, row)
    case .combination(let directions):
      return directions.reduce(Optional<Board.Position>.some(self), {
        return $0?.getNextPosition(to: $1)
      })
    }
  }
}
