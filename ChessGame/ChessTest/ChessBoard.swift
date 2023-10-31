//
//  ChessBoard.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

final class ChessBoard {

    // MARK: - Property

    var board: [[Piece?]]
    var currentPlayer: Color = .white

    // MARK: - Init

    /// 체스 프로그램을  초기화
    init() {
        board = Array(
            repeating: Array(
                repeating: nil,
                count: File.allCases.count
            ),
            count: Rank.allCases.count
        )

        for file in File.allCases {
            board[Rank.two.rawValue - 1][file.rawValue] = Pawn(color: .black)
        }
        board[Rank.one.rawValue - 1] = [
            Rook(color: .black),
            Knight(color: .black),
            Bishop(color: .black),
            nil,
            Queen(color: .black),
            Bishop(color: .black),
            Knight(color: .black),
            Rook(color: .black)
        ]

        for file in File.allCases {
            board[Rank.seven.rawValue - 1][file.rawValue] = Pawn(color: .white)
        }
        board[Rank.eight.rawValue - 1] = [
            Rook(color: .white),
            Knight(color: .white),
            Bishop(color: .white),
            nil,
            Queen(color: .white),
            Bishop(color: .white),
            Knight(color: .white),
            Rook(color: .white)
        ]
    }

    // MARK: - Helpers

    /// 1-rank부터 8-rank까지 rank 문자열로 보드 위에 체스말을 리턴
    func display() -> String {
        var displayBoard = ""
        for rank in Rank.allCases {
            displayBoard += getRowString(forRank: rank)
        }
        print(displayBoard)
        return displayBoard
    }

    private func getRowString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        let pieces = board[rank.rawValue - 1].compactMap { $0?.icon.unicode ?? "." }
        return rankString + pieces.joined() + "\n"
    }

    /// 움직이려는 말이 있는 위치(from)와 이동하려는 위치(to)를 차례대로 입력받아서 말을 이동
    func movePiece(from: Position, to: Position) {
        guard canMove(from: from, to: to) else { return }

        /// player turn 변경
        currentPlayer = (currentPlayer == .white) ? .black : .white
    }

    func canMove(from: Position, to: Position) -> Bool {
        let pieceAtFromPosition = board[from.rank.rawValue - 1][from.file.rawValue]
        let pieceAtToPosition = board[to.rank.rawValue - 1][to.file.rawValue]

        return isVaildPlayer(fromPiece: pieceAtFromPosition) &&
        isVaildColor(fromPiece: pieceAtFromPosition, toPiece: pieceAtToPosition) &&
        isDestinationEmptyOrHasDifferentColor(pieceAtToPosition, fromPieceAtFromPosition: pieceAtFromPosition) &&
        isValidRankMove(from: from, to: to)
    }

    /// 현재 턴과 움직이려는(from) 말의 color가 동일한지 확인
     private func isVaildPlayer(fromPiece: Piece?) -> Bool {
         guard currentPlayer == fromPiece?.color else { return false }
         return true
     }

    /// from과 to의 체스말이 동일한지 확인
    private func isVaildColor(fromPiece: Piece?, toPiece: Piece?) -> Bool {
        if toPiece == nil {
            return true
        }
        return fromPiece?.color != toPiece?.color
    }

    /// 같은 색상의 말이 to 위치에 다른 말이 이미 있는지 확인
    private func isDestinationEmptyOrHasDifferentColor(
        _ toPiece: Piece?, fromPieceAtFromPosition: Piece?
    ) -> Bool {
        if let toPiece = toPiece {
            return toPiece.color != fromPieceAtFromPosition?.color
        }
        return true
    }

    /// 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직임이 가능
    private func isValidRankMove(from: Position, to: Position) -> Bool {
        let fromRank = from.rank.rawValue
        let toRank = to.rank.rawValue

        guard let fromPiece = board[from.rank.rawValue - 1][from.file.rawValue] else {
            return false
        }

        switch fromPiece.color {
        case .black:
            return fromRank <= toRank
        case .white:
            return fromRank >= toRank
        }
    }
}
