//
//  Position.swift
//  Chess_game
//
//  Created by 박진섭 on 10/29/23.
//

struct Position: Hashable {
    let rank: Rank
    let file: File

    init(rank: Rank, file: File) {
        self.rank = rank
        self.file = file
    }

    init?(rankRawValue: Int, fileRawValue: Int) {
        guard let rank = Rank(rawValue: rankRawValue),
              let file = File(rawValue: fileRawValue) else { return nil }
        self.rank = rank
        self.file = file
    }
}

extension Position {
    func getNearPosition(_ direction: Direction) -> Position? {
        let currentRankRawValue = rank.rawValue
        let currentFileRawValue = file.rawValue
        switch direction {
        case .top:
            return .init(rankRawValue: currentRankRawValue - 1,
                         fileRawValue: currentFileRawValue)
        case .right:
            return .init(rankRawValue: currentRankRawValue,
                         fileRawValue: currentFileRawValue + 1)
        case .left:
            return .init(rankRawValue: currentRankRawValue,
                         fileRawValue: currentFileRawValue - 1)
        case .bottom:
            return .init(rankRawValue: currentRankRawValue + 1,
                         fileRawValue: currentFileRawValue)
        case .topLeftDiagonal:
            return .init(rankRawValue: currentRankRawValue - 1,
                         fileRawValue: currentFileRawValue - 1)
        case .topRightDiagonal:
            return .init(rankRawValue: currentRankRawValue - 1,
                         fileRawValue: currentFileRawValue + 1)
        case .bottomLeftDiagonal:
            return .init(rankRawValue: currentRankRawValue + 1,
                         fileRawValue: currentFileRawValue - 1)
        case .bottomRightDiagonal:
            return .init(rankRawValue: currentRankRawValue + 1,
                         fileRawValue: currentFileRawValue + 1)
        }
    }
}

enum Rank: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
}

enum File: Int, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
}

enum Direction {
    case top, right, left, bottom
    case topLeftDiagonal, topRightDiagonal, bottomLeftDiagonal, bottomRightDiagonal
}
