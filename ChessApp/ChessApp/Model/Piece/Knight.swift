//
//  Knight.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/22.
//

import Foundation

struct Knight: Piece {
  let type: PieceType = .knight
  let color: PieceColor
  let directionMovable: Set<MoveVector> = [
    .combination([.up(1), .upLeft(1)]), .combination([.up(1), .upRight(1)]),
    .combination([.left(1), .upLeft(1)]), .combination([.left(1), .downLeft(1)]),
    .combination([.down(1), .downLeft(1)]), .combination([.down(1), .downRight(1)]),
    .combination([.right(1), .downRight(1)]), .combination([.right(1), .upRight(1)]),
  ]
  
  init(_ color: PieceColor) {
    self.color = color
  }
}
