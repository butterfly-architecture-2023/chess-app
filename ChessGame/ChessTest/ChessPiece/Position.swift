//
//  Position.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

struct Position {
    let rank: Int   /// row
    let file: File  /// column

    /// 유효성 검증
    func isValidPosition() -> Bool {
        return rank >= 1 && rank <= 8 &&
        file.index >= 0 && file.index < File.allCases.count
    }
}
