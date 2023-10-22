//
//  Bishop.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/22.
//

import Foundation

struct Bishop: Piece {
  let type: PieceType = .bishop
  let color: PieceColor
  let directionMovable: Set<MoveDirection> = .init([
    .upLeft(nil), .upRight(nil), .downLeft(nil), .downRight(nil)
  ])
  
  init(_ color: PieceColor) {
    self.color = color
  }
}
