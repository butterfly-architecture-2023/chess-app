//
//  Board.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/17.
//

import Foundation

final class Board {
    
    private var square: [[Piece]]
    
    init(square: [[Piece]]) {
        self.square = square
    }
    
    convenience init() {
        self.init(square: Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8))
    }
    
    // 프로그래밍 요구사항 1. 체스말(Piece) 존재 여부
    var hasPieces: Bool {
        square.flatMap { $0 }.contains{ $0.category != .empty }
    }
}
