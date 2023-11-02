//
//  PieceCreator.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

protocol PieceCreator {
    static func createDefaultPieces() -> [Piece]
}

struct PawnFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whitePawns = File.allCases.map { WhitePawn(color: .white, position: .init(rank: .seven, file: $0)) }
        let blackPawns = File.allCases.map { BlackPawn(color: .black, position: .init(rank: .two, file: $0)) }
        pieces.append(contentsOf: whitePawns)
        pieces.append(contentsOf: blackPawns)
        return pieces
    }
}

struct RookFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whiteRooks: [Piece] = [
            WhiteRook(color: .white, position: .init(rank: .eight, file: .A)),
            WhiteRook(color: .white, position: .init(rank: .eight, file: .H))
        ]
        let blackRooks: [Piece] = [
            BlackRook(color: .black, position: .init(rank: .one, file: .A)),
            BlackRook(color: .black, position: .init(rank: .one, file: .H))
        ]
        pieces.append(contentsOf: whiteRooks)
        pieces.append(contentsOf: blackRooks)
        return pieces
    }
}

struct KnightFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whiteKnight: [Piece] = [
            WhiteKnight(color: .white, position: .init(rank: .eight, file: .B)),
            WhiteKnight(color: .white, position: .init(rank: .eight, file: .G))
        ]
        let blackKnight: [Piece] = [
            BlackKnight(color: .black, position: .init(rank: .one, file: .B)),
            BlackKnight(color: .black, position: .init(rank: .one, file: .G))
        ]
        pieces.append(contentsOf: whiteKnight)
        pieces.append(contentsOf: blackKnight)
        return pieces
    }
}

struct BishopFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whiteBishop: [Piece] = [
            WhiteBishop(color: .white, position: .init(rank: .eight, file: .C)),
            WhiteBishop(color: .white, position: .init(rank: .eight, file: .F))
        ]
        let blackBishop: [Piece] = [
            BlackBishop(color: .black, position: .init(rank: .one, file: .C)),
            BlackBishop(color: .black, position: .init(rank: .one, file: .F))
        ]
        pieces.append(contentsOf: whiteBishop)
        pieces.append(contentsOf: blackBishop)
        return pieces
    }
}

struct QueenFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whiteQueen: [Piece] = [
            WhiteQueen(color: .white, position: .init(rank: .eight, file: .E))
        ]
        let blackQueen: [Piece] = [
            BlackQueen(color: .black, position: .init(rank: .one, file: .E))
        ]
        pieces.append(contentsOf: whiteQueen)
        pieces.append(contentsOf: blackQueen)
        return pieces
    }
}

struct KingFactory: PieceCreator {
    static func createDefaultPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whiteKing: [Piece] = [
            WhiteKing(color: .white, position: .init(rank: .eight, file: .D))
        ]
        let blackKing: [Piece] = [
            BlackKing(color: .black, position: .init(rank: .one, file: .D))
        ]
        pieces.append(contentsOf: whiteKing)
        pieces.append(contentsOf: blackKing)
        return pieces
    }
}
