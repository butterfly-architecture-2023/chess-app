//
//  PieceManager.swift
//  Chess_game
//
//  Created by 박진섭 on 10/23/23.
//

import Foundation

protocol PieceManageAble {
    associatedtype Piece: BoardPieceAble
    var pieces: [Piece] { get }
    func initPieces()
}


final class ChessPieceManager: PieceManageAble {
    typealias Piece = ChessPiece

    var pieces: [Piece] = []

    func initPieces() {
        initPawns()
        initRooks()
        initKnight()
        initBishop()
        initQueen()
        initKing()
    }

    private func initPawns() {
        let whitePawns = File.allCases.map { Piece(color: .white, position: (rank: .seven, file: $0), type: .pawn) }
        let blackPawns = File.allCases.map { Piece(color: .black, position: (rank: .two, file: $0), type: .pawn) }
        self.pieces.append(contentsOf: whitePawns + blackPawns)
    }

    private func initRooks() {
        let whiteRooks: [Piece] = [
            .init(color: .white, position: (rank: .one, file: .A), type: .rook),
            .init(color: .white, position: (rank: .one, file: .H), type: .rook)
        ]
        let blackRooks: [Piece] = [
            .init(color: .black, position: (rank: .eight, file: .A), type: .rook),
            .init(color: .black, position: (rank: .eight, file: .H), type: .rook)
        ]
        self.pieces.append(contentsOf: whiteRooks + blackRooks)
    }

    private func initKnight() {
        let whiteKnight: [Piece] = [
            .init(color: .white, position: (rank: .one, file: .B), type: .knight),
            .init(color: .white, position: (rank: .one, file: .G), type: .knight)
        ]
        let blackKnight: [Piece] = [
            .init(color: .black, position: (rank: .eight, file: .B), type: .knight),
            .init(color: .black, position: (rank: .eight, file: .G), type: .knight)
        ]
        self.pieces.append(contentsOf: whiteKnight + blackKnight)
    }

    private func initBishop() {
        let whiteKnight: [Piece] = [
            .init(color: .white, position: (rank: .one, file: .C), type: .bishop),
            .init(color: .white, position: (rank: .one, file: .F), type: .bishop)
        ]
        let blackKnight: [Piece] = [
            .init(color: .black, position: (rank: .eight, file: .C), type: .knight),
            .init(color: .black, position: (rank: .eight, file: .F), type: .knight)
        ]
        self.pieces.append(contentsOf: whiteKnight + blackKnight)
    }

    private func initQueen() {
        let whiteKnight: [Piece] = [
            .init(color: .white, position: (rank: .one, file: .E), type: .queen)
        ]
        let blackKnight: [Piece] = [
            .init(color: .black, position: (rank: .eight, file: .E), type: .queen)
        ]
        self.pieces.append(contentsOf: whiteKnight + blackKnight)
    }

    private func initKing() {
        let whiteKnight: [Piece] = [
            .init(color: .white, position: (rank: .one, file: .D), type: .knight)
        ]
        let blackKnight: [Piece] = [
            .init(color: .black, position: (rank: .eight, file: .D), type: .knight)
        ]
        self.pieces.append(contentsOf: whiteKnight + blackKnight)
    }


    func getMovablePositions() -> [BoardPosition] {

        return []
    }

}
