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
            displayBoard += getRankString(forRank: rank)
        }
        print(displayBoard)
        return displayBoard
    }

    private func getRankString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        let pieces = board[rank.rawValue - 1].compactMap { $0?.icon ?? "." }
        return rankString + pieces.joined() + "\n"
    }
}
