//
//  Board.swift
//  SwiftChessApp
//
//  Created by Han Songe on 2023/10/18.
//

import Foundation

struct Board {
    private let fileNames: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H"]
    private let size: Int = 8
    
    private var squares: [[Piece?]]
    private var turn: PieceColor = .white
    
    init() {
        self.squares = Array(repeating: Array(repeating: nil, count: size), count: size)
    }
}
