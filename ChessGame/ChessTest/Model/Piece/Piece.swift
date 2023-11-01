//
//  Piece.swift
//  ChessGame
//
//  Created by 강호성 on 10/25/23.
//

import Foundation

protocol Piece {
    var icon: PieceIcon { get }
    var color: Color { get }
    var maxCount: Int { get }
    var score: Int { get }
}
