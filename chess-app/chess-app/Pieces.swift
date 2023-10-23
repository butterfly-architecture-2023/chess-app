//
//  Pieces.swift
//  chess-app
//
//  Created by Jihee hwang on 2023/10/22.
//

import Foundation

// MARK: - Piece

struct Piece {
    let type: PieceType
    let color: PieceColor
    
    init(type: PieceType, color: PieceColor) {
        self.type = type
        self.color = color
    }
}

extension Piece {
    // TODO: - 중첩 Switch문을 어떻게 해결할 것인가 ..
    var movableRange: MovableRange {
        switch self.type {
        case .pawn:
            switch self.color {
            case .black:
                return .init(file: 0, rank: 1)
            case .white:
                return .init(file: 0, rank: -1)
            case .none:
                return .init(file: 0, rank: 0)
            }
            
        // TODO: - 추후 룰 적용
        default:
            return .init(file: 0, rank: 0)
        }
    }
}

// MARK: - PieceType

enum PieceType {
    case pawn, rook, knight, bishop, queen, king, none
}

// MARK: - PieceColor

enum PieceColor {
    case black, white, none
    
    var symbol: String {
        switch self {
        case .black:
            return "\u{265F}"
        case .white:
            return "\u{2659}"
        case .none:
            return "."
        }
    }
}

// MARK: - MovableRange

struct MovableRange: Equatable {
    let file: Int
    let rank: Int
}
