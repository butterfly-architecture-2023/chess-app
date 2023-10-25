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
  var directionMovable: Set<MoveVector> { get }
  init(_ color: PieceColor)
}

extension Piece {
  var typeDesc: String {
    switch self.type {
    case .pawn:
      return color == .black ? "\u{265F}" : "\u{2659}"
    case .bishop:
      return color == .black ? "\u{265D}" : "\u{2657}"
    case .knight:
      return color == .black ? "\u{265E}" : "\u{2658}"
    case .queen:
      return color == .black ? "\u{265B}" : "\u{2655}"
    case .rook:
      return color == .black ? "\u{265C}" : "\u{2656}"
    }
  }
}
