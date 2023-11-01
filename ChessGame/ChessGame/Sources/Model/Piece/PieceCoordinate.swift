//
//  PieceCoordinate.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/29.
//

import Foundation

struct PieceCoordinate: Hashable {
    
    let rank: Rank
    let file: File
}

// MARK: - Rank

extension PieceCoordinate {
    enum Rank: Int, CaseIterable {
        case one = 0
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }
}

// MARK: - File

extension PieceCoordinate {
    enum File: Int, CaseIterable {
        case A = 0, B, C, D, E, F, G, H
    }
}
