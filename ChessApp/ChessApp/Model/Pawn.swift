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
    
    func canMoveRank(from: Position.Rank, to: Position.Rank) -> Bool {
        var canMove: Bool = false
        
        let diff = abs(from.rawValue - to.rawValue)
        
        switch color {
        case .white:
            canMove = from.rawValue > to.rawValue && diff == 1
        case .black:
            canMove = from.rawValue < to.rawValue && diff == 1
        }
        
        return canMove
    }

    // file을 이동할 수 있는지
    func canMoveFile(from: Position.File, to: Position.File) -> Bool {
        var canMove: Bool = false
        return canMove
    }

}
