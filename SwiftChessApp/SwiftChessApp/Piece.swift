//
//  Piece.swift
//  SwiftChessApp
//
//  Created by Han Songe on 2023/10/18.
//

import Foundation

protocol Piece {
    var color: PieceColor { get }
    var symbol: String { get }
}

enum PieceColor {
    case black
    case white
    
    func getOppositeColor() -> PieceColor {
        switch self {
        case .black:
            return .white
        case .white:
            return .black
        }
    }
}
