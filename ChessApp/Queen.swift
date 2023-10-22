//
//  Queen.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/22.
//

import Foundation

struct Queen: Piece {
  let type: PieceType = .queen
  let color: PieceColor
  let directionMovable: Set<MoveDirection> = [
    .up(nil), .upRight(nil), .right(nil), .downRight(nil), .down(nil), .downLeft(nil), .left(nil), .upLeft(nil)
  ]
  
  init(_ color: PieceColor) {
    self.color = color
  }
}
