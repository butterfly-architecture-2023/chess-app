//
//  Column.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/16.
//

import Foundation

enum Column: String, CaseIterable, Equatable {
  case A, B, C, D, E, F, G, H
  
  var order: Int {
    switch self {
    case .A: return 0
    case .B: return 1
    case .C: return 2
    case .D: return 3
    case .E: return 4
    case .F: return 5
    case .G: return 6
    case .H: return 7
    }
  }
  
  static func - (lhs: Column, rhs: Column) -> Column? {
    (lhs.order - rhs.order).toColumn
  }
  
  static func + (lhs: Column, rhs: Column) -> Column? {
    (lhs.order + rhs.order).toColumn
  }
  
  static func - (lhs: Column, rhs: Int) -> Column? {
    (lhs.order - rhs).toColumn
  }
  
  static func + (lhs: Column, rhs: Int) -> Column? {
    (lhs.order + rhs).toColumn
  }
}

extension Column: Comparable {
  static func < (lhs: Column, rhs: Column) -> Bool {
    lhs.order < rhs.order
  }
}

extension Column: CustomStringConvertible {
  var description: String {
    return self.rawValue
  }
}

extension String {
  var toColumn: Column? {
    Column.allCases.first(where: {$0.rawValue == self})
  }
  
  var getColumn: Column? {
    String(self.first ?? Character("")).toColumn
  }
}

extension Int {
  var toColumn: Column? {
    Column.allCases.first(where: {$0.order == self})
  }
}
