//
//  Piece.swift
//  ChessApp
//
//  Created by elly on 10/21/23.
//

import Foundation

protocol Piece {
    // 점수, color, 생성위치, 움직일 수 있는 위치
    var point: Int { get }
    var pieceColorType: PieceColorType { get }
    func showIcon() -> String
    func movablePosition() -> String
}

class Pawn: Piece {
    var point: Int = 1
    var pieceColorType: PieceColorType
    
    init(pieceColorType: PieceColorType) {
        self.pieceColorType = pieceColorType
    }
    
    func showIcon() -> String {
        return pieceColorType == .black ? "♟" : "♙"
    }
    
    func movablePosition() -> String {
        return ""
    }
}

class EmptySpace: Piece {
    var point: Int = 0
    var pieceColorType: PieceColorType = .none
    
    func showIcon() -> String {
        return "."
    }
    
    func movablePosition() -> String {
        return ""
    }
}
