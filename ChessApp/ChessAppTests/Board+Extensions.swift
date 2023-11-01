//
//  Board+Extensions.swift
//  ChessAppTests
//
//  Created by 백상휘 on 2023/10/29.
//

import Foundation

extension Board {
  func getCmd(_ cmd: String) throws -> (from: Position, to: Position) {
    let cmds = cmd.split(separator: " ").map({String($0)})
    guard cmds.count == 2 else {
      throw InputError.formatError
    }
    
    return try (from: getPosition(from: cmds[0]), to: getPosition(from: cmds[1]))
  }
}
