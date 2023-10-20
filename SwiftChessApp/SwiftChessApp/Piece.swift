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
    static var maxCount: Int { get }
    func getMovableDirections() -> [moveDirection]
}

enum PieceColor {
    case black
    case white
    
    var startingRows: [Int] {
        switch self {
        case .black:
            return [0, 1]
        case .white:
            return [6, 7]
        }
    }
    
    func getOppositeColor() -> PieceColor {
        switch self {
        case .black:
            return .white
        case .white:
            return .black
        }
    }
}

struct moveDirection {
    let file: Int
    let rank: Int
}
