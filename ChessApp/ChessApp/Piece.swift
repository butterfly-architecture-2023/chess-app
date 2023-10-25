//
//  Piece.swift
//  ChessApp
//
//  Created by elly on 10/21/23.
//

import Foundation

protocol Piece {
    // 점수, color, 생성위치, 움직일 수 있는 위치
    var pieceType: PieceType { get}
    var point: Int { get }
    var pieceColorType: PieceColorType { get }
    func showIcon() -> String
    func movablePosition(_ currentPosition: Position) -> [Position]
}

class Pawn: Piece {
    var pieceType: PieceType = .pawn
    var point: Int = 1
    var pieceColorType: PieceColorType
    
    init(pieceColorType: PieceColorType) {
        self.pieceColorType = pieceColorType
    }
    
    func showIcon() -> String {
        return pieceColorType == .black ? "♟" : "♙"
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        print(currentPosition.rank, currentPosition.file)
        return [currentPosition.top(), currentPosition.bottom(),
                currentPosition.left(), currentPosition.right()]
    }
}

class Bishop: Piece {
    var pieceType: PieceType = .bishop
    var point: Int = 3
    var pieceColorType: PieceColorType
    
    init(pieceColorType: PieceColorType) {
        self.pieceColorType = pieceColorType
    }
    
    func showIcon() -> String {
        return pieceColorType == .black ? "♝" : "♗"
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        return currentPosition.diagonal()
    }
}

class Rook: Piece {
    var pieceType: PieceType = .rook
    var point: Int = 5
    var pieceColorType: PieceColorType
    
    init(pieceColorType: PieceColorType) {
        self.pieceColorType = pieceColorType
    }
    
    func showIcon() -> String {
        return pieceColorType == .black ? "♜" : "♖"
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        return currentPosition.topList() + currentPosition.bottomList() + currentPosition.leftList() + currentPosition.rightList()
    }
}

class EmptySpace: Piece {
    var pieceType: PieceType = .empty
    var point: Int = 0
    var pieceColorType: PieceColorType = .white
    
    func showIcon() -> String {
        return "."
    }
    
    func movablePosition(_ currentPosition: Position) -> [Position] {
        return [Position(rank: 0, file: 0)]
    }
}

enum PieceType {
    case empty
    case pawn
    case bishop
    case rook
}
