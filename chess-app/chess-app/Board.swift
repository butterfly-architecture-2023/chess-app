//
//  Board.swift
//  chess-app
//
//  Created by Jihee hwang on 2023/10/22.
//

import Foundation

// MARK: - Board

final class Board {
    private let size = 8
    private var chessBoard = [[Piece]]()
    
    init() {
        reset()
    }
    
    /// 보드 초기화
    private func reset() {
        chessBoard = Array(
            repeating: Array(
                repeating: .init(
                    type: .none,
                    color: .none
                ), count: size
            ), count: size
        )
        
        setupPwans()
    }
    
    /// Pwan 초기화
    private func setupPwans() {
        let blackPwan = Piece(
            type: .pawn,
            color: .black
        )
        
        let whitePwan = Piece(
            type: .pawn,
            color: .white
        )
        
        chessBoard
            .insert(Array(repeating: blackPwan,
                          count: size
                         ), at: Rank.two.number
            ) 
        
        chessBoard
            .insert(Array(repeating: whitePwan,
                          count: size
                         ), at: Rank.seven.number
            )
    }
 
    /// 현재 보드 상태 출력
    private func display() -> [[String]] {
        chessBoard
            .map { file in
                file.map { rank in
                    rank.color.symbol
                }
            }
    }
    
    /// 말 이동 가능 여부 파악
    private func move(from: Position, to: Position) -> Bool {
        return true
    }
}
