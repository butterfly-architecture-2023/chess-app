//
//  Board.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/17.
//

import Foundation

final class Board {
    
    private var square: [[Piece]]
    
    init(square: [[Piece]]) {
        self.square = square
    }
    
    convenience init() {
        self.init(square: Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8))
    }
    
    // 프로그래밍 요구사항 1. 체스말(Piece) 존재 여부
    var hasPieces: Bool {
        square.flatMap { $0 }.contains{ $0.category != .empty }
    }
    
    // 프로그래밍 요구사항 2. 흑과 백 점수를 출력
    func score() -> (blackPawn: Int, whitePawn: Int) {
        
        var score = (blackPawn: 0, whitePawn: 0)
        
        square.flatMap{ $0 }.forEach { piece in
            if piece.category == .pawn(color: .black) {
                score.blackPawn += 1
            } else if piece.category == .pawn(color: .white) {
                score.whitePawn += 1
            }
        }
        
        return score
    }
    
    // 프로그래밍 요구사항 3.
    // Board는 모든 말의 위치를 알 수 있고, display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴한다
    // 흑색 Pawn는 ♟ U+265F를 빈 곳은 "."을 표시한다.
    // 백색 Pawn는 ♙ U+2659를 빈 곳은 "."을 표시한다.
    func display() -> [[String]] {
        let convertedSquare = square.map{ $0.map{ $0.category.unicode } }
        return convertedSquare
    }
}
