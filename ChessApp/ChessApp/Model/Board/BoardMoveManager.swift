//
//  BoardMoveManager.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/29.
//

import Foundation

struct BoardMoveManager {
  func getMoveVectors(
    board: [Position],
    piece: any Piece,
    from start: Position,
    to dest: Position
  ) -> [MoveVector] {
    // 목적지까지 이동하기 위해 경로를 탐색
    let directionToMove = start.direction(to: dest, color: piece.color)
    // 이동하기 위한 경로가 말이 움직일 수 있는 경로인지 검사
  directionLoop: for direction in directionToMove {
    for movable in piece.directionMovable {
      if movable.equalDirection(with: direction) {
        continue directionLoop
      }
    }
    
    return []
  }
    return directionToMove
  }
  
  /// 도착지점을 제외하고 경로 상에 있는 모든 체스말들을 반환합니다.
  func getExistsPieces(
    board: [Position],
    from position: Position,
    to direction: MoveVector
  ) -> [(any Piece)] {
    var position = position
    let distance = (direction.distance ?? 0)-1
    var result = [(any Piece)]()
    
    guard distance >= 0 else {
      return result
    }
    
    for _ in 0..<distance {
      if let next = position.getNextPosition(to: direction) {
        position = next
        
        if let piece = board[next]?.piece {
          result.append(piece)
        }
      }
    }
    
    return result
  }
  
  /// 도착지점을 제외하고 경로 상에 있는 모든 체스말들을 반환합니다.
  func getExistsPieces(
    board: [Position],
    from start: Position,
    to dest: Position
  ) -> [(any Piece)] {
    guard let startPiece = board[start]?.piece else { return [] }
    var result = [(any Piece)]()
    let vectors = getMoveVectors(
      board: board,
      piece: startPiece,
      from: start,
      to: dest)
    
    for vector in vectors {
      result.append(contentsOf: getExistsPieces(
        board: board,
        from: start,
        to: vector))
    }
    
    return result
  }
  
  func getPositions(from start: Position, to dest: Position) -> [Position] {
    var start = start
    var result = [start]
    
    while start != dest {
      var newRow: Row?
      var newColumn: Column?
      if dest.row != start.row {
        newRow = start.row + (dest.row > start.row ? 1 : -1)
      }
      
      if dest.column != start.column {
        newColumn = start.column + (dest.column > start.column ? 1 : -1)
      }
      
      start = Position(newColumn ?? start.column, newRow ?? start.row)
      result.append(start)
    }
    
    return result
  }
  
  func getPositions(from start: Position, using vector: MoveVector) -> [Position] {
    var start = start
    var result = [start]
    guard let distance = vector.distance else { return result }
    
    switch vector {
    case .up(_):
      for i in stride(from: distance, to: 0, by: -1) {
        if let row = i.toRow {
          result.append(Position(start.column, row))
        }
      }
    case .upRight(_):
      for i in stride(from: distance, to: 0, by: -1) {
        if let row = (i).toRow, let column = (i * -1).toColumn {
          result.append(Position(column, row))
        }
      }
    case .right(_):
      for i in stride(from: distance, to: 0, by: 1) {
        if let column = i.toColumn {
          result.append(Position(column, start.row))
        }
      }
    case .downRight(_):
      for i in stride(from: distance, to: 0, by: 1) {
        if let row = i.toRow, let column = i.toColumn {
          result.append(Position(column, row))
        }
      }
    case .down(_):
      for i in stride(from: distance, to: 0, by: 1) {
        if let column = i.toColumn {
          result.append(Position(column, start.row))
        }
      }
    case .downLeft(_):
      for i in stride(from: distance, to: 0, by: 1) {
        if let row = i.toRow, let column = (i * -1).toColumn {
          result.append(Position(column, row))
        }
      }
    case .left(_):
      for i in stride(from: distance, to: 0, by: -1) {
        if let column = i.toColumn {
          result.append(Position(column, start.row))
        }
      }
    case .upLeft(_):
      for i in stride(from: distance, to: 0, by: 1) {
        if let row = (i * -1).toRow, let column = i.toColumn {
          result.append(Position(column, row))
        }
      }
    case .combination(var vectors):
      while vectors.isEmpty == false {
        let positions = getPositions(from: start, using: vectors.removeFirst())
        result.append(contentsOf: positions)
        
        if let lastPosition = positions.last {
          start = lastPosition
        }
      }
    }
    
    return result
  }
}
