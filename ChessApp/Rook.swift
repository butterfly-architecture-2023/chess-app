//
//  Rook.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/23.
//

import Foundation

struct Rook: Piece {
  let type: PieceType = .rook
  let color: PieceColor
  let directionMovable: Set<MoveDirection> = [
    .up(nil), .left(nil), .down(nil), .right(nil)
  ]
  
  init(_ color: PieceColor) {
    self.color = color
  }
}
