//
//  Piece.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/15.
//

import Foundation

protocol Piece {
    var color: Color { get }
    var position: Position { get set }
}
