//
//  Board.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

class Board: ObservableObject {
  private let pieceManager = BoardPieceManager()
  private let moveManager = BoardMoveManager()
  private var selected: Position?
  
  @Published var currentTurn: PieceColor = .white
  @Published var score = [PieceColor.black: 0, PieceColor.white: 0]
  
  @Published var positions: [Position]
  
  var positionPerRow: [[Position]] {
    guard positions.isEmpty == false else { return [[]] }
    var positions = positions
    var result = [[Position]]()
    
    while positions.isEmpty == false, positions.count.isMultiple(of: 8) {
      result.append(Array(positions[0..<8]))
      positions.removeSubrange(0...7)
    }
    
    if positions.isEmpty == false {
      result.append(positions)
    }
    return result
  }
  
  init() {
    self.positions = pieceManager.getNormalBoard()
  }
  
  // 처음 입력
  func inputCmd(_ cmd: Position) throws {
    guard let cmd = positions[cmd] else {
      throw InputError.formatError
    }
    
    let highlighted = positions.filter({ $0.isHighlighted })
    
    guard let selected = selected, highlighted.isEmpty == false else {
      // 선택되어 있는 자리가 없다. 그러나 체스말을 선택하고자 한다.
      highlight(start: cmd)
      return
    }
    
    if highlighted.contains(cmd) {
      try move(from: selected, to: cmd)
    } else {
      self.selected = nil
      highlighted.forEach { $0.isHighlighted = false }
    }
    
    dismissSelected()
  }
  
  func dismissSelected() {
    selected = nil
    positions.forEach({ $0.isHighlighted = false })
  }
  
  private func move(from start: Position, to dest: Position) throws {
    let sideEffect = try movePiece(from: start, to: dest)
    currentTurn = currentTurn == .white ? .black : .white
    
    if let effect = sideEffect {
      calculate(effect)
    }
  }
  
  private func highlight(start: Position) {
    selected = start
    selected?.isHighlighted = true
    if let directionMovable = start.piece?.directionMovable {
      for vector in directionMovable {
        for item in moveManager.getPositions(from: start, using: vector) {
          print(start, vector, item)
          positions[item]?.isHighlighted = true
        }
      }
    }
  }
  
  /// positions 일부의 체스말 상태를 바꾸는 Side-Effect 존재. 이동 성공여부를 반환한다.
  private func movePiece(from start: Position, to dest: Position) throws -> PieceColor? {
    let destColor = positions[dest]?.piece?.color
    updateBoard(from: start, to: dest)
    let currentDestColor = positions[dest]?.piece?.color
    
    return destColor != currentDestColor ? destColor : nil
  }
  
  private func updateBoard(from start: Position, to dest: Position) {
    let piece = positions[start]?.piece
    positions[start]?.piece = nil
    positions[dest]?.piece = piece
  }
  
  // 점수를 수정하는 Side-Effect 존재
  private func calculate(_ effect: PieceColor) {
    let color: PieceColor = effect == .black ? .white : .black
    score[color] = (score[color] ?? 0) + 1
  }
  
  func getPosition(from input: String) throws -> Position {
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
  
  func display() -> String {
    var result = ""
    result += Column.allCases.reduce(" ", { $0 + "\($1)" }) + "\n"
    
    for (inx, row) in Row.allCases.enumerated() {
      result += "\(row)"
      result += positions.rows(row).reduce("", { $0 + ($1.piece?.typeDesc ?? ".") })
      result += (inx != Row.allCases.endIndex-1 ? "\n" : "")
    }
    
    return result
  }
}

enum InputError: Error {
  case maximumLengthExceeded, minimumLengthViolated, formatError, noColumn, noRow
}

enum MoveError: Error {
  case noPiece(Position), noDirectionContained, haveObstacle(Position, any Piece)
}
