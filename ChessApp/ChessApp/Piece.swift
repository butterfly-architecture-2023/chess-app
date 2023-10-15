//
//  Piece.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

protocol Piece: Equatable {
  var type: PieceType { get }
  var color: PieceColor { get }
  var directionMovable: Set<MoveDirection> { get }
  init(_ color: PieceColor)
}
