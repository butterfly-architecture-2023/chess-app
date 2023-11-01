//
//  InputTextManager.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/29.
//

import Foundation

final class InputTextManager {
    /// 입력 Text 값 해석, Position 리턴, 실패시 nil 리턴
    static func makeInputPosition(text: String) -> (from: Position, to: Position)? {
        let textSplits = text.components(separatedBy: "->")
        guard
            textSplits.count == 2,
            let fromPosition = parsePosition(String(textSplits[0])),
            let toPosition = parsePosition(String(textSplits[1]))
        else {
            return nil
        }
        
        return (from: fromPosition, to: toPosition)
    }
    
    private static func parsePosition(_ positionString: String) -> Position? {
        guard
            positionString.count == 2,
            let columnString = positionString.first,
            let rankString = positionString.last,
            let column = Column(rawValue: String(columnString)),
            let rank = Rank(rawValue: Int(String(rankString)) ?? 0)
        else {
            return nil
        }
        
        return Position(rank: rank, column: column)
    }
}
