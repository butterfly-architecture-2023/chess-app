//
//  Board.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

protocol Board {
    var pieceManager: ChessPieceManager { get }
    var mapManager: MapManager { get }
    func getCurrentTeamScores() -> TeamScore 
    func move(from startPosition : Position, to destination: Position) -> MoveResult
    init(_ pieces: [Piece])
}

final class ChessBoard: Board {
    private(set) var pieceManager: ChessPieceManager
    private(set) var mapManager: MapManager = .init()

    init(_ pieces: [Piece]) {
        self.pieceManager = ChessPieceManager(pieces)
        self.mapManager.makeMap(pieces)
    }
    
    func getCurrentTeamScores() -> TeamScore {
        return pieceManager.getCurrentTeamScores()
    }

    func move(from startPosition : Position, to destination: Position) -> MoveResult {
        let movedPieces = pieceManager.move(from: startPosition, to: destination)
        let map = mapManager.makeMap(movedPieces)
        mapManager.resetPiece(position: startPosition)
        return .init(pieces: movedPieces, teamScore: getCurrentTeamScores())
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
