//
//  Position.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/25.
//

import Foundation

class Position: CustomStringConvertible, Equatable {
  static func == (lhs: Position, rhs: Position) -> Bool {
    lhs.row == rhs.row && lhs.column == rhs.column
  }
  
  let row: Row, column: Column
  
  var piece: (any Piece)?
  var isHighlighted = false
  
  init(_ column: Column, _ row: Row) {
    self.row = row
    self.column = column
  }
  
  init?(_ column: String, _ row: Int) {
    guard
      let row = row.toRow,
      let column = column.toColumn
    else {
      return nil
    }
    
    self.row = row
    self.column = column
  }
  
  var description: String {
    "\(column)"+"\(row)"
  }
}

extension Position {
  func distance(to position: Position) -> Int {
    if self.row != position.row {
      return abs(row.rawValue - position.row.rawValue)
    } else {
      return abs(column.order - position.column.order)
    }
  }
  
  func direction(to position: Position, color: PieceColor) -> [MoveVector] {
    guard position != self else {
      return []
    }
    
    var current = self, result: [MoveVector] = []
    var step: MoveVector?
    
    while current != position {
      // 좌우 여부를 확인
      if self.column > position.column {
        step = .left((step?.distance ?? 0) + 1)
      } else if self.column < position.column {
        step = .right((step?.distance ?? 0) - 1)
      }
      
      // 상하 여부 혹은 대각선인지 확인
      if self.row > position.row {
        if case .left(let dist) = step {
          step = .upLeft(dist)
        } else if case .right(let dist) = step {
          step = .upRight(dist)
        } else {
          step = .up(step?.distance ?? 1)
        }
      } else {
        if case .left(let dist) = step {
          step = .downLeft(dist)
        } else if case .right(let dist) = step {
          step = .downRight(dist)
        } else {
          step = .down(step?.distance ?? 1)
        }
      }
      
      if let nextStep = step, let nextPosition = current.getNextPosition(to: nextStep) {
        if result.isEmpty == false, result.last?.equalDirection(with: nextStep) ?? false {
          let removed = result.removeLast()
          result.append(removed.add(1))
        } else {
          result.append(nextStep)
        }
        
        step = nextStep
        current = nextPosition
      } else {
        break
      }
    }
    
    return result
  }
  
  func getNextPosition(to direction: MoveVector) -> Position? {
    // 이동하는 거리는 고려하지 않음. 다음 칸은 무조건 한칸이므로 Int 값 불필요
    switch direction {
    case .up(_), .upRight(_), .upLeft(_), .downLeft(_), .downRight(_), .down(_), .left(_), .right(_):
      let columnDistance: Int = {
        switch direction {
        case .downRight(_), .upRight(_), .right(_): return 1 // 오른쪽으로 가므로 +1
        case .downLeft(_), .upLeft(_), .left(_): return -1 // 왼쪽으로 가므로 -1
        default: return 0
        }
      }()
      let rowDistance: Int = {
        switch direction {
        case .downRight(_), .downLeft(_), .down(_): return 1 // 내려가므로 +1
        case .upRight(_), .upLeft(_), .up(_): return -1 // 올라가므로 -1
        default: return 0
        }
      }()
      
      guard
        let newColumn = column + columnDistance,
        let newRow = row + rowDistance
      else {
        return nil
      }
      
      return Position(newColumn, newRow)
    case .combination(let directions):
      return directions.reduce(Optional<Position>.some(self), {
        return $0?.getNextPosition(to: $1)
      })
    }
  }
}
