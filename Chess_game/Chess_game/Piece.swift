//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

// Game: 체스가 아니라 장기가 될수 있다면 어떻게 말의 타입을 정할 것인가.
// Piece: 단순히 데이터 타입
// Piece의 움직임: PieceManager
// PieceManager: 검증(Piece가 움직일 수 있는지, 움직일수 있는 곳은 어디인지)
// Board: 점수세기, pieceManger의 리턴값에 따라 분기처리
// Game: 어떤 게임을 할 것인지(chess, Chinese chess ... )

protocol BoardPieceAble {
    var color: PieceColor { get }
    var isAlive: Bool { get set }
    var position: BoardPosition { get set }
}

struct ChessPiece: BoardPieceAble {
    var color: PieceColor
    var isAlive: Bool
    var position: BoardPosition
    var type: ChessPieceType


    init(color: PieceColor,
         isAlive: Bool = true,
         position: BoardPosition,
         type: ChessPieceType)
    {
        self.color = color
        self.type = type
        self.isAlive = isAlive
        self.position = position
    }
}

enum ChessPieceType {
    case pawn
    case bishop
    case knight
    case rook
    case queen
    case king
}

enum PieceColor: CaseIterable {
    case black
    case white
}
