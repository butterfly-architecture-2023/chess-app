//
//  Chess.swift
//  PairChess
//
//  Created by 김혜지 on 10/26/23.
//

struct Position: Equatable {
    let file: File
    let rank: Rank
    
    init?(file: File?, rank: Rank?) {
        guard let file, let rank else { return nil }
        self.file = file
        self.rank = rank
    }
}

protocol King {
    var position: Position { get }
}

extension King {
    private func getAroundPositions(at position: Position) -> [Position] {
        let pointRank = position.rank
        let pointFile = position.file
        
        let topLeftDiagonal = Position(file: File(rawValue: pointFile.rawValue - 1), rank: Rank(rawValue: pointRank.rawValue + 1))
        let topRightDiagonal = Position(file: File(rawValue: pointFile.rawValue + 1), rank: Rank(rawValue: pointRank.rawValue + 1))
        let bottomLeftDiagonal = Position(file: File(rawValue: pointFile.rawValue - 1), rank: Rank(rawValue: pointRank.rawValue - 1))
        let bottomRightDiagonal = Position(file: File(rawValue: pointFile.rawValue + 1), rank: Rank(rawValue: pointRank.rawValue - 1))
        
        let top = Position(file: pointFile, rank: Rank(rawValue: pointRank.rawValue + 1))
        let bottom = Position(file: pointFile, rank: Rank(rawValue: pointRank.rawValue - 1))
        let left = Position(file: File(rawValue: pointFile.rawValue - 1), rank: pointRank)
        let right = Position(file: File(rawValue: pointFile.rawValue + 1), rank: pointRank)
        
        let positions = [topLeftDiagonal, topRightDiagonal, bottomLeftDiagonal, bottomRightDiagonal, top, bottom, left, right]
        return positions.compactMap({ $0 })
    }
    
    func move(to position: Position) -> Bool {
        let positions = getAroundPositions(at: position)
        return positions.contains(where: { $0 == position })
    }
}

class BlackKing: King {
    private(set) var position: Position
    
    init?(position: Position) {
        guard position.file == .D && position.rank == .one else { return nil }
        self.position = position
    }
}

class WhiteKing: King {
    private(set) var position: Position
    
    init?(position: Position) {
        guard position.file == .D && position.rank == .eight else { return nil }
        self.position = position
    }
}

enum PieceColor {
    case black
    case white
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
