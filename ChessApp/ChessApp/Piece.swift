//
//  Piece.swift
//  ChessApp
//
//  Created by Se Eun Lee on 2023/10/18.
//

import Foundation

// TODO: PieceType enum과 역할이 불분명함. 차라리 protocol로 만드는 것도?
// PieceType에서도 color를 뽑을 수 있을거 같긴한데, 역할 분리가 더 애매해지는 느낌
class Piece: Equatable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.color == rhs.color && lhs.type == rhs.type
    }
    
    let color: PieceColor
    let type: PieceType

    init(_ color: PieceColor, _ type: PieceType) {
        self.color = color
        self.type = type
    }

    func getMovablePositions(from position: Position) -> [Position] {
        return self.type.actionList.map { action in
            // TODO: 계산 로직은 Action 객체나 Position 쪽으로 역할을 분리하는게 나을지?
            let movedRow = position.rank.rawValue + action.rowAction
            let movedColumn = position.file.value + action.columnAction

            guard let newRank = Rank(rawValue: movedRow),
                  let newFile = File(movedColumn) else {
                return nil
            }

            return Position(newRank, newFile)
        }.compactMap { $0 }
    }
}

enum PieceColor: String {
    case black, white
}

enum PieceType: Equatable, CustomStringConvertible {
    static var allCases: (PieceColor) -> [PieceType] {
        { color in return [.pawn(color)] }
    }

    case pawn(_ color: PieceColor? = nil)
}

extension PieceType {
    var description: String {
        switch self {
        case .pawn: return "pawn"
        }
    }

    var icon: String {
        switch self {
        case .pawn(let color):
            return color == .black ? "♟" : "♙"
        }
    }

    var point: Int {
        switch self {
        case .pawn:
            return 1
        }
    }

    var initPositions: [Position] {
        switch self {
        case .pawn(let color):
            if color == .black {
                return File.allCases.map { Position(.two, $0) }
            } else {
                return File.allCases.map { Position(.seven, $0) }
            }
        }
    }

    var actionList: [Action] {
        switch self {
        case .pawn(let color):
            if color == .black {
                return [Action(rowAction: 1)]
            } else {
                return [Action(rowAction: -1)]
            }
        }
    }
}
