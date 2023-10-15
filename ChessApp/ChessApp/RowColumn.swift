//
//  RowColumn.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/15.
//

import Foundation

enum Row: Int, CaseIterable, Equatable {
  case `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`
}

extension Int {
  var toRow: Row? {
    Row.allCases.first(where: {$0.rawValue == self})
  }
}

enum Column: String, CaseIterable, Equatable {
  case A, B, C, D, E, F, G, H
}

extension String {
  var toColumn: Column? {
    Column.allCases.first(where: {$0.rawValue == self})
  }
}
