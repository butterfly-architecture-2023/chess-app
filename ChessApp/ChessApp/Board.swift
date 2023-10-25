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
    positions.forEach { $0.piece = nil }
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
  
  // movePiece
  @discardableResult
  func move(from start: Position, to dest: Position) throws -> Bool {
    let (result, _) = try movePiece(from: start, to: dest)
    currentTurn = currentTurn == .white ? .black : .white
    
    return result
  }
  
  /// positions 일부의 체스말 상태를 바꾸는 Side-Effect 존재. 이동 성공여부를 반환한다.
  private func movePiece(
    from start: Position,
    to dest: Position
  ) throws -> (result: Bool, sideEffect: (any Piece)?) {
    guard let startPiece = getPiece(start) else {
      throw MoveError.noPiece(start)
    }
    
    let vectors = getMoveVectors(using: startPiece, from: start, to: dest)
    guard vectors.isEmpty == false else {
      return (false, nil)
    }
    
    try checkObstacle(vectors: vectors, from: start, to: dest)
    
    return try updateBoard(using: startPiece, from: start, to: dest)
  }
  
  private func getMoveVectors(
    using piece: any Piece,
    from start: Position,
    to dest: Position
  ) -> [MoveVector] {
    // 목적지까지 이동하기 위해 경로를 탐색
    let directionToMove = start.direction(to: dest, color: piece.color)
    // 이동하기 위한 경로가 말이 움직일 수 있는 경로인지 검사
    guard piece.directionMovable.isSuperset(of: directionToMove) else {
      return []
    }
    
    return directionToMove
  }
  
  private func checkObstacle(
    vectors: [MoveVector],
    from start: Position,
    to dest: Position
  ) throws {
    // 진행 중 장애물이 있는지 검사
    var current = start
    
    for direction in vectors {
      
      let piece = getExistsPieces(from: current, to: direction)
      
      if let obstacle = piece.first {
        throw MoveError.haveObstacle(current, obstacle)
      } else { // 장애물이 있음
        
        if let nextStep = current.getNextPosition(to: direction) {
          current = nextStep
        } else { // 다음에 움직일 위치를 가져오지 못함
          
          if current.column == .H || current.row == .eight {
            throw InputError.maximumLengthExceeded
          } else {
            throw InputError.minimumLengthViolated
          }
        }
      }
    }
  }
  
  private func updateBoard(
    using piece: any Piece,
    from start: Position,
    to dest: Position
  ) throws -> (Bool, any Piece) {
    
    let destPiece = getPiece(dest)
    
    if let destPiece = destPiece {
      
      if destPiece.color == piece.color {
        throw MoveError.haveObstacle(dest, destPiece)
      } else {
        calculate(destPiece)
      }
    }
    
    positions[start]?.piece = nil
    positions[dest]?.piece = piece
    return (true, destPiece ?? piece) // 만약 destPiece 가 nil 이면 단순 이동이었으며, 아니면 점수계산이 되었거나 throw 하였다는 것임.
  }
  
  // 점수를 수정하는 Side-Effect 존재
  private func calculate(_ sideEffect: (any Piece)) {
    let color: PieceColor = sideEffect.color == .black ? .white : .black
    score[color] = (score[color] ?? 0) + 1
  }
  
  /// 도착지점을 제외하고 경로 상에 있는 모든 체스말들을 반환합니다.
  private func getExistsPieces(from position: Position, to direction: MoveVector) -> [(any Piece)] {
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
  
  enum MoveError: Error {
    case noPiece(Position), noDirectionContained, haveObstacle(Position, any Piece)
  }
}
