//
//  PieceCreator.swift
//  Chess_game
//
//  Created by 박진섭 on 10/25/23.
//

// MARK: 단순 생성 로직뿐이라 테스트 X
struct PieceFactory {
    static func createPieces(_ gameType: GameType) -> [Piece] {
        switch gameType {
        case .chess:
            getDefaultChessPieces()
        }
    }

    static private func getDefaultChessPieces() -> [Piece] {
        var pieces: [Piece] = []
        let whitePawns = File.allCases.map { Pawn(color: .white, position: .init(rank: .seven, file: $0)) }
        let blackPawns = File.allCases.map { Pawn(color: .black, position: .init(rank: .two, file: $0)) }

        let whiteRooks: [Piece] = [
            Rook(color: .white, position: .init(rank: .eight, file: .A)),
            Rook(color: .white, position: .init(rank: .eight, file: .H))
        ]
        let blackRooks: [Piece] = [
            Rook(color: .black, position: .init(rank: .one, file: .A)),
            Rook(color: .black, position: .init(rank: .one, file: .H))
        ]

        let whiteKnight: [Piece] = [
            Knight(color: .white, position: .init(rank: .eight, file: .B)),
            Knight(color: .white, position: .init(rank: .eight, file: .G))
        ]
        let blackKnight: [Piece] = [
            Knight(color: .black, position: .init(rank: .one, file: .B)),
            Knight(color: .black, position: .init(rank: .one, file: .G))
        ]

        let whiteBishop: [Piece] = [
            Bishop(color: .white, position: .init(rank: .eight, file: .C)),
            Bishop(color: .white, position: .init(rank: .eight, file: .F))
        ]
        let blackBishop: [Piece] = [
            Bishop(color: .black, position: .init(rank: .one, file: .C)),
            Bishop(color: .black, position: .init(rank: .one, file: .F))
        ]

        let whiteQueen: [Piece] = [
            Queen(color: .white, position: .init(rank: .eight, file: .E))
        ]
        let blackQueen: [Piece] = [
            Queen(color: .black, position: .init(rank: .one, file: .E))
        ]

        let whiteKing: [Piece] = [
            King(color: .white, position: .init(rank: .eight, file: .D))
        ]
        let blackKing: [Piece] = [
            King(color: .black, position: .init(rank: .one, file: .D))
        ]

        pieces.append(contentsOf: whitePawns + blackPawns)
        pieces.append(contentsOf: whiteRooks + blackRooks)
        pieces.append(contentsOf: whiteKnight + blackKnight)
        pieces.append(contentsOf: whiteBishop + blackBishop)
        pieces.append(contentsOf: whiteQueen + blackQueen)
        pieces.append(contentsOf: whiteKing + blackKing)
        return pieces
    }
}
