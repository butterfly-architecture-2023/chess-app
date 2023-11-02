//
//  ChessBoard.swift
//  ChessGame
//
//  Created by 강호성 on 10/18/23.
//

import Foundation

final class ChessBoard {

    // MARK: - Property

    var pieces: [Position: Piece]
    var currentPlayer: Color = .white

    // MARK: - Init

    /// 체스 프로그램을  초기화
    init() {
        pieces = [:]

        for rank in Rank.allCases {
            for file in File.allCases {
                let position = Position(rank: rank, file: file)
                pieces[position] = nil
            }
        }
        initPiecesInBoard()
    }

    // MARK: - Helpers

    func initPiecesInBoard() {
        for file in File.allCases {
            pieces[Position(rank: .two, file: file)] = Pawn(color: .black)
        }

        pieces[Position(rank: .one, file: .a)] = Rook(color: .black)
        pieces[Position(rank: .one, file: .b)] = Knight(color: .black)
        pieces[Position(rank: .one, file: .c)] = Bishop(color: .black)
        pieces[Position(rank: .one, file: .d)] = King(color: .black)
        pieces[Position(rank: .one, file: .e)] = Queen(color: .black)
        pieces[Position(rank: .one, file: .f)] = Bishop(color: .black)
        pieces[Position(rank: .one, file: .g)] = Knight(color: .black)
        pieces[Position(rank: .one, file: .h)] = Rook(color: .black)

        for file in File.allCases {
            pieces[Position(rank: .seven, file: file)] = Pawn(color: .white)
        }

        pieces[Position(rank: .eight, file: .a)] = Rook(color: .white)
        pieces[Position(rank: .eight, file: .b)] = Knight(color: .white)
        pieces[Position(rank: .eight, file: .c)] = Bishop(color: .white)
        pieces[Position(rank: .eight, file: .d)] = King(color: .white)
        pieces[Position(rank: .eight, file: .e)] = Queen(color: .white)
        pieces[Position(rank: .eight, file: .f)] = Bishop(color: .white)
        pieces[Position(rank: .eight, file: .g)] = Knight(color: .white)
        pieces[Position(rank: .eight, file: .h)] = Rook(color: .white)
    }
}

// MARK: - Display
extension ChessBoard {
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
        var pieceString = ""

        for file in File.allCases {
            let position = Position(rank: rank, file: file)
            if let piece = pieces[position] {
                pieceString.append(piece.icon.unicode)
            } else {
                pieceString.append(".")
            }
        }

        return rankString + pieceString + "\n"
    }
}

// MARK: - Move
extension ChessBoard {
    func movePiece(from: Position, to: Position) {
        guard canMove(from: from, to: to) else { return }

        /// player turn 변경
        currentPlayer = (currentPlayer == .white) ? .black : .white
    }

    /// 움직이려는 말이 있는 위치(from)와 이동하려는 위치(to)를 입력
    func canMove(from: Position, to: Position) -> Bool {
        let pieceAtFromPosition = pieces[from]
        let pieceAtToPosition = pieces[to]

        return isVaildPlayer(fromPiece: pieceAtFromPosition) &&
        isVaildColor(fromPiece: pieceAtFromPosition, toPiece: pieceAtToPosition) &&
        isDestinationEmptyOrHasDifferentColor(pieceAtToPosition, fromPieceAtFromPosition: pieceAtFromPosition) &&
        isValidRankMove(from: from, to: to)
    }

    /// 현재 턴의 color와 움직이려는 말의 color가 같은지
    private func isVaildPlayer(fromPiece: Piece?) -> Bool {
        guard currentPlayer == fromPiece?.color else { return false }
        return true
    }

    /// from과 to의 체스말은 동일 여부
    private func isVaildColor(fromPiece: Piece?, toPiece: Piece?) -> Bool {
        if toPiece == nil {
            return true
        }
        return fromPiece?.color != toPiece?.color
    }

    ///  to 위치에 같은 색상의 말이 이미 있으면 옮길 수 없는지
    private func isDestinationEmptyOrHasDifferentColor(
        _ toPiece: Piece?, fromPieceAtFromPosition: Piece?
    ) -> Bool {
        if let toPiece = toPiece {
            return toPiece.color != fromPieceAtFromPosition?.color
        }
        return true
    }

    /// 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
    private func isValidRankMove(from: Position, to: Position) -> Bool {
        let fromRank = from.rank.rawValue
        let toRank = to.rank.rawValue

        guard let fromPiece = pieces[from] else {
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
