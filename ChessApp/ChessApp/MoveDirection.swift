//
//  MoveDirection.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

enum MoveDirection: Hashable {
  case `up`(Int?), upRight(Int?), `right`(Int?), downRight(Int?), `down`(Int?), downLeft(Int?), `left`(Int?), upLeft(Int?), combination([MoveDirection])
  
  var distance: Int? {
    switch self {
    case .up(let distance):
      return distance
    case .upRight(let distance):
      return distance
    case .right(let distance):
      return distance
    case .downRight(let distance):
      return distance
    case .down(let distance):
      return distance
    case .downLeft(let distance):
      return distance
    case .left(let distance):
      return distance
    case .upLeft(let distance):
      return distance
    case .combination(let distances):
      return distances.reduce(0, {$0 + ($1.distance ?? 0)})
    }
  }
  
  func add(_ num: Int) -> Self {
    switch self {
    case .up(let dist):
      return .up((dist ?? 0)+num)
    case .upRight(let dist):
      return .upRight((dist ?? 0)+num)
    case .right(let dist):
      return .right((dist ?? 0)+num)
    case .downRight(let dist):
      return .downRight((dist ?? 0)+num)
    case .down(let dist):
      return .down((dist ?? 0)+num)
    case .downLeft(let dist):
      return .downLeft((dist ?? 0)+num)
    case .left(let dist):
      return .left((dist ?? 0)+num)
    case .upLeft(let dist):
      return .upLeft((dist ?? 0)+num)
    case .combination(let array):
      return .combination(array.map({$0.add(num)}))
    }
  }
}
