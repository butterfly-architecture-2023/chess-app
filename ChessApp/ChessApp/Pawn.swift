//
//  Pawn.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

class Pawn: Piece {
  static func == (lhs: Pawn, rhs: Pawn) -> Bool {
    lhs.color == rhs.color
    && lhs.type == rhs.type
    && lhs.directionMovable == rhs.directionMovable
  }
  
  let type: PieceType = .pawn
  let color: PieceColor
  let directionMovable: Set<MoveDirection> = Set([
    .up(1),
    .up(2),
    .upLeft(1),
    .upRight(1)
  ])
  
  var moveCount: Int = 0
  
  required init(_ color: PieceColor) {
    self.color = color
  }
}
