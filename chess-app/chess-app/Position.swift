//
//  Position.swift
//  chess-app
//
//  Created by Jihee hwang on 2023/10/22.
//

import Foundation

// MARK: - File

enum File {
    case A, B, C, D, E, F, G, H
    
    var number: Int {
        switch self {
        case .A:
            return 0
        case .B:
            return 1
        case .C:
            return 2
        case .D:
            return 3
        case .E:
            return 4
        case .F:
            return 5
        case .G:
            return 6
        case .H:
            return 7
        }
    }
}

// MARK: - Rank

enum Rank {
    case one, two, three, four, five, six, seven, eight
    
    var number: Int {
        switch self {
        case .one:
            return 0
        case .two:
            return 1
        case .three:
            return 2
        case .four:
            return 3
        case .five:
            return 4
        case .six:
            return 5
        case .seven:
            return 6
        case .eight:
            return 7
        }
    }
}

// MARK: - Position

final class Position {
    var file: Int
    var rank: Int
    
    init(file: File, rank: Rank) {
        self.file = file.number
        self.rank = rank.number
    }
}
