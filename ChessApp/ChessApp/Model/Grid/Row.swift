//
//  RowColumn.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

enum Row: Int, CaseIterable, Equatable {
  case `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`
  
  // 헷갈림을 방지하고자 rawValue 를 이름과 같이 정의
  var rawValue: Int {
    switch self {
    case .one: return 0
    case .two: return 1
    case .three: return 2
    case .four: return 3
    case .five: return 4
    case .six: return 5
    case .seven: return 6
    case .eight: return 7
    }
  }
  
  static func - (lhs: Row, rhs: Row) -> Row? {
    (lhs.rawValue - rhs.rawValue).toRow
  }
  
  static func + (lhs: Row, rhs: Row) -> Row? {
    (lhs.rawValue + rhs.rawValue).toRow
  }
  
  static func - (lhs: Row, rhs: Int) -> Row? {
    (lhs.rawValue - rhs).toRow
  }
  
  static func + (lhs: Row, rhs: Int) -> Row? {
    (lhs.rawValue + rhs).toRow
  }
}

extension Row: Comparable {
  static func < (lhs: Row, rhs: Row) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
}

extension Row: CustomStringConvertible {
  var description: String {
    return "\(self.rawValue)"
  }
}

extension Int {
  var toRow: Row? {
    Row.allCases.first(where: {$0.rawValue == self})
  }
}

extension String {
  var getRow: Row? {
    guard let num = Int(String(self.last ?? Character(""))) else {
      return nil
    }
    return (num - 1).toRow
  }
}
