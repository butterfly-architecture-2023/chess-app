//
//  Piece.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

protocol Piece {
    static var maxCount: Int { get }
    var color: Color { get }
    var score: Int { get }
    var displayText: String { get }

    func isPossibleInitPosition(with position: Position) -> Bool
    func canMove(from: Position, to: Position) -> Bool
}
