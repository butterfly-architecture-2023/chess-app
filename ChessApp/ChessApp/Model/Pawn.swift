//
//  Pawn.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

struct Pawn: Piece {

    var color: Color

    static var maxCount: Int = 8

    // 출력할 pawn 텍스트
    func getPrintString() -> String {
        switch color {
        case .white:
            return "U+2659"
        case .black:
            return "U+265F"
        }
    }

    // rank를 이동할 수 있는지
    func canMoveRank(from: Position.Rank, to: Position.Rank) -> Bool {
        var canMove: Bool = false
        return canMove
    }

    // file을 이동할 수 있는지
    func canMoveFile(from: Position.File, to: Position.File) -> Bool {
        var canMove: Bool = false
        return canMove
    }

}
