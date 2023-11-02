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
    func movablePosition(_ currentPosition: Position) -> [Position]
}
