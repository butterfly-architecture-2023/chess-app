//
//  Column.swift
//  ChessApp
//
//  Created by 백상휘 on 2023/10/16.
//

import Foundation

enum Column: String, CaseIterable, Equatable {
  case A, B, C, D, E, F, G, H
}

extension String {
  var toColumn: Column? {
    Column.allCases.first(where: {$0.rawValue == self})
  }
  
  var getColumn: Column? {
    String(self.first ?? Character("")).toColumn
  }
}
