//
//  Define.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/22.
//

struct Define {
    //  체스판 8 x 8
    static let emptyPieceList: [[ChessPiece]] = {
        let list = Rank.allCases.map { rank in
            return Column.allCases.map { column in
                return EmptyPiece(pieceColor: .none,
                                  pieceType: .none,
                                  position: Position(rank: rank, column: column))
            }
        }
        return list
    }()
    
    static let firstWhiteLineList: [ChessPiece] = {
        [
            Rook(pieceColor: .white, pieceType: .rook, position: Position(rank: .eight, column: .a)),
            Knight(pieceColor: .white, pieceType: .knight, position: Position(rank: .eight, column: .b)),
            Bishop(pieceColor: .white, pieceType: .bishop, position: Position(rank: .eight, column: .c)),
            EmptyPiece(pieceColor: .none, pieceType: .none, position: Position(rank: .eight, column: .d)),
            Queen(pieceColor: .white, pieceType: .queen, position: Position(rank: .eight, column: .e)),
            Bishop(pieceColor: .white, pieceType: .bishop, position: Position(rank: .eight, column: .f)),
            Knight(pieceColor: .white, pieceType: .knight, position: Position(rank: .eight, column: .g)),
            Rook(pieceColor: .white, pieceType: .rook, position: Position(rank: .eight, column: .h))
        ]
    }()
    
    static let firstBlackLineList: [ChessPiece] = {
        [
            Rook(pieceColor: .black, pieceType: .rook, position: Position(rank: .one, column: .a)),
            Knight(pieceColor: .black, pieceType: .knight, position: Position(rank: .one, column: .b)),
            Bishop(pieceColor: .black, pieceType: .bishop, position: Position(rank: .one, column: .c)),
            EmptyPiece(pieceColor: .none, pieceType: .none, position: Position(rank: .one, column: .d)),
            Queen(pieceColor: .black, pieceType: .queen, position: Position(rank: .one, column: .e)),
            Bishop(pieceColor: .black, pieceType: .bishop, position: Position(rank: .one, column: .f)),
            Knight(pieceColor: .black, pieceType: .knight, position: Position(rank: .one, column: .g)),
            Rook(pieceColor: .black, pieceType: .rook, position: Position(rank: .one, column: .h))
        ]
    }()
    
    static let firstWhitePawnList: [ChessPiece] = {
        let list = zip(Rank.allCases, Column.allCases).map {
            Pawn(pieceColor: .white,
                 pieceType: .pawn,
                 position: Position(rank: .seven, column: $0.1))
        }
        return list
    }()
    
    static let firstBlackPawnList: [Pawn] = {
        let list = zip(Rank.allCases, Column.allCases).map {
            Pawn(pieceColor: .black, pieceType: .pawn, position: Position(rank: .two, column: $0.1))
        }
        return list
    }()
}

struct ChessPieceSymbols {
    static let blackPawn = "♟"
    static let blackBishop = "♝"
    static let blackKnight = "♞"
    static let blackRook = "♜"
    static let blackQueen = "♛"
    
    static let whitePawn = "♙"
    static let whiteBishop = "♗"
    static let whiteKnight = "♘"
    static let whiteRook = "♖"
    static let whiteQueen = "♕"
}

