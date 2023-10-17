//
//  ChessBoard.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

final class ChessBoard {

    // MARK: - Property

    private var board = Pawn.initPosition()

    // MARK: - Init

    /// 체스 프로그램을 시작하면 흑/백 Pawn을 초기화한다.
    init() {
        for file in File.allCases {
            board[1][file.index] = Pawn(pieceType: .black, position: Position(rank: 1, file: file))
        }
        for file in File.allCases {
            board[6][file.index] = Pawn(pieceType: .white, position: Position(rank: 6, file: file))
        }
    }

    // MARK: - Display

    /// 1-rank부터 8-rank까지 rank 문자열로 보드 위에 체스말을 리턴
    func display() -> String {
        var boardString = ""
        var count = 0

        print(" ABCDEFGH")
        for row in board {
            count += 1
            let rowString = row.map { $0.pieceType.rawValue }.joined(separator: "")
            boardString += "\(count)" + rowString + "\n"
        }
        print(boardString)
        return boardString
    }

    // MARK: - Initial Position

    /// 입력: 초기화 메서드 테스트 실행
    func checkInitialPosition() -> Bool {
        return checkInitialPiecePosition() && checkMaximumPieceCounts()
    }

    /// 검증1: 체스말 초기 위치가 아니면 생성하지 않는다. (흑색은 2-rank 또는 백색 7-rank)
    private func checkInitialPiecePosition() -> Bool {
        for rank in 1...8 {
            for file in File.allCases {
                let piece = board[rank - 1][file.index]
                if (rank == 2 || rank == 7) && (piece.pieceType != .black && piece.pieceType != .white) {
                    return false
                }
            }
        }
        return true
    }

    /// 검증2: 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
    /// 검증3: Pawn는 색상별로 8개만 가능하다.
    private func checkMaximumPieceCounts() -> Bool {
        var blackPawnsCount = 0
        var whitePawnsCount = 0

        for rank in 1...8 {
            for file in File.allCases {
                let piece = board[rank - 1][file.index]

                if piece.pieceType == .black {
                    blackPawnsCount += 1
                } else if piece.pieceType == .white {
                    whitePawnsCount += 1
                }
            }
        }

        if blackPawnsCount > 8 || whitePawnsCount > 8 {
            return false
        }

        if blackPawnsCount != 8 || whitePawnsCount != 8 {
            return false
        }

        return true
    }
}
