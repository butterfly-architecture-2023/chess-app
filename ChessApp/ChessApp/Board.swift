//
//  Board.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation
import Combine

class Board {
  let positions = Set<Position>.boardGrid
  var currentTurn: PieceColor = .white
  var score: [PieceColor: Int] = [
    .black: 0,
    .white: 0
  ]
  
  init() {
    positions.rows(.two).forEach { $0.piece = Pawn(.black) }
    positions.rows(.seven).forEach { $0.piece = Pawn(.white) }
  }
  
  // movePiece, calculate 호출
  func move(from start: Position, to dest: Position) -> Bool {
    let result = movePiece(from: start, to: dest)
    calculate(from: start, to: dest, piece: result)
    
    currentTurn = currentTurn == .white ? .black : .white
    
    return false
  }
  
  // positions 일부의 체스말 상태를 바꾸는 Side-Effect 존재
  private func movePiece(
    from start: Position,
    to deest: Position
  ) -> (any Piece)? {
    
    return nil
  }
  
  // 점수를 수정하는 Side-Effect 존재
  private func calculate(
    from start: Position,
    to dest: Position,
    piece: (any Piece)?
  ) {
    
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
}

extension Set where Element == Board.Position {
  // Board 의 구조는 8*8로 구성하는 것이 일반적이므로 static 이용
  static var boardGrid: Self = Set([
    .init("A",1),.init("A",2),.init("A",3),.init("A",4),.init("A",5),.init("A",6),.init("A",7),.init("A",8),
    .init("B",1),.init("B",2),.init("B",3),.init("B",4),.init("B",5),.init("B",6),.init("B",7),.init("B",8),
    .init("C",1),.init("C",2),.init("C",3),.init("C",4),.init("C",5),.init("C",6),.init("C",7),.init("C",8),
    .init("D",1),.init("D",2),.init("D",3),.init("D",4),.init("D",5),.init("D",6),.init("D",7),.init("D",8),
    .init("E",1),.init("E",2),.init("E",3),.init("E",4),.init("E",5),.init("E",6),.init("E",7),.init("E",8),
    .init("F",1),.init("F",2),.init("F",3),.init("F",4),.init("F",5),.init("F",6),.init("F",7),.init("F",8),
    .init("G",1),.init("G",2),.init("G",3),.init("G",4),.init("G",5),.init("G",6),.init("G",7),.init("G",8),
    .init("H",1),.init("H",2),.init("H",3),.init("H",4),.init("H",5),.init("H",6),.init("H",7),.init("H",8)
  ].compactMap({$0}))
  
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
