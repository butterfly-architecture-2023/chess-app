//
//  Array+Extensions.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/25.
//

import Foundation

extension Array where Element == Position {
  static var boardGrid: Self = [
    .init("A",1),.init("A",2),.init("A",3),.init("A",4),.init("A",5),.init("A",6),.init("A",7),.init("A",8),
    .init("B",1),.init("B",2),.init("B",3),.init("B",4),.init("B",5),.init("B",6),.init("B",7),.init("B",8),
    .init("C",1),.init("C",2),.init("C",3),.init("C",4),.init("C",5),.init("C",6),.init("C",7),.init("C",8),
    .init("D",1),.init("D",2),.init("D",3),.init("D",4),.init("D",5),.init("D",6),.init("D",7),.init("D",8),
    .init("E",1),.init("E",2),.init("E",3),.init("E",4),.init("E",5),.init("E",6),.init("E",7),.init("E",8),
    .init("F",1),.init("F",2),.init("F",3),.init("F",4),.init("F",5),.init("F",6),.init("F",7),.init("F",8),
    .init("G",1),.init("G",2),.init("G",3),.init("G",4),.init("G",5),.init("G",6),.init("G",7),.init("G",8),
    .init("H",1),.init("H",2),.init("H",3),.init("H",4),.init("H",5),.init("H",6),.init("H",7),.init("H",8)
  ].compactMap({$0})
  
  func rows(_ row: Row) -> Self {
    self.filter({$0.row == row})
  }
  
  func columns(_ column: Column) -> Self {
    self.filter({$0.column == column})
  }
  
  subscript(position: Position) -> Position? {
    get {
      self.first(where: {$0 == position})
    }
  }
}
