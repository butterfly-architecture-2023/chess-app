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

    // MARK: - Move Chess Piece

    /// 입력: 움직이려는 말이 있는 위치(from)와 이동하려는 위치(to)를 차례대로 입력받아서 말을 이동한다.
    func movePiece(from: Pawn, to: Pawn) -> Bool {
        return canMove(from: from, to: to) &&
        isValidRankMove(from: from, to: to) &&
        isOneSpaceMove(from: from, to: to)
    }

    private func canMove(from: Pawn, to: Pawn) -> Bool {
        let pawnAtFromPosition = board[from.position.rank - 1][from.position.file.index]
        let pawnAtToPosition = board[to.position.rank - 1][to.position.file.index]

        /// 검증1: 형식에 맞지 않으면 다시 입력받는다.
        guard from.position.isValidPosition() && to.position.isValidPosition() else {
            return false
        }

        /// 검증2: from 위치에 동일한 pieceType의 체스말이 존재하는지 확인한다.
        if pawnAtFromPosition.pieceType != from.pieceType {
            return false
        }

        /// 검증3: from과 to의 체스말은 동일할 수 없다.
        if from.pieceType != to.pieceType {
            return false
        }

        /// 검증4: 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
        if pawnAtToPosition.pieceType == to.pieceType {
            return false
        }

        return true
    }

    /// 검증5 - 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
    private func isValidRankMove(from: Pawn, to: Pawn) -> Bool {
        let fromPieceRank = from.position.rank
        let toPieceRank = to.position.rank

        switch from.pieceType {
        case .black:
            if fromPieceRank >= toPieceRank {
                return false
            }
        case .white:
            if fromPieceRank <= toPieceRank {
                return false
            }
        case .dot:
            return true
        }

        return true
    }

    /// 검증6 - 1칸만 움직일 수 있다. (직선/대각선)
    private func isOneSpaceMove(from: Pawn, to: Pawn) -> Bool {
        let rankDifference = abs(from.position.rank - to.position.rank)
        let fileDifference = abs(from.position.file.index - to.position.file.index)

        if rankDifference > 1 || fileDifference > 1 {
            return false
        }

        return true
    }
}
