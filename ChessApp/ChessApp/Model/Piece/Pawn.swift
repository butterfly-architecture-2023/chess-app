//
//  Pawn.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

struct Pawn: Piece {
  let type: PieceType = .pawn
  let color: PieceColor
  let directionMovable: Set<MoveVector>
  
  var moveCount: Int = 0
  
  init(_ color: PieceColor) {
    self.color = color
    self.directionMovable = color == .black
    ? Set([.up(1), .upLeft(1), .upRight(1)])
    : Set([.down(1), .downLeft(1), .downRight(1)])
  }
}
