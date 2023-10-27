//
//  Board.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

struct Position: Hashable {
    let rank: Rank
    let file: File
}

final class Board {
    private let pieceManager: PieceManager
    private let mapManager: MapManager = .init()

    init(pieces: [Piece]) {
        self.pieceManager = PieceManager(pieces)
        self.mapManager.makeMap(pieces)
    }
    
    func move(from startPosition : Position, to destination: Position) -> String? {
        if let moveResult = pieceManager.move(from: startPosition, to: destination) {
            let map = mapManager.makeMap(moveResult)
            mapManager.resetPiece(position: startPosition)
            return convertMapToDisplay(map)
        } else {
            return nil
        }
    }

    private func convertMapToDisplay(_ map: [[String]]) -> String {
        var board = String(map.flatMap({$0}).joined())
        var index = board.index(board.startIndex, offsetBy: 8)

        while index < board.endIndex {
            board.insert(contentsOf: "\n", at: index)
            index = board.index(index, offsetBy: 8 + "\n".count)
        }
        return board
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

