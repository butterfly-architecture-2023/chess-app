//
//  MoveDirection.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

enum MoveDirection: Hashable {
  case `up`(Int), upRight(Int), `right`(Int), downRight(Int), `down`(Int), downLeft(Int), `left`(Int), upLeft(Int)
}
