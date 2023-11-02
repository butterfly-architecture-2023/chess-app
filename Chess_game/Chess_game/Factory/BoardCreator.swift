//
//  BoardFactory.swift
//  Chess_game
//
//  Created by 박진섭 on 10/29/23.
//
protocol BoardCreator {
    static var pieceCreators: [PieceCreator.Type] { get }
    static func createBoard() -> Board
}

struct ChessBoardFactory: BoardCreator {
    static var pieceCreators: [PieceCreator.Type] = [
        PawnFactory.self,
        RookFactory.self,
        KnightFactory.self,
        BishopFactory.self,
        QueenFactory.self,
        KingFactory.self,
    ]

    static func createBoard() -> Board {
        var chessPieces: [Piece] = []
        for creator in pieceCreators {
            chessPieces.append(contentsOf: creator.createDefaultPieces())
        }
        return ChessBoard(chessPieces)
    }
}
