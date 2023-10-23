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
    private var player: PieceColor = .white
    
    // MARK: - Initialize
    
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
    
    // MARK: - Move Method
    
    /// 말 이동
    private func movePiece(piece: Piece, from: Position, to: Position) {
        guard piece.color == player else { return }
        guard validateMove(piece: piece, from: from, to: to) else { return }
        guard move(from: from, to: to) else { return }
        
        chessBoard[to.file][to.rank] = chessBoard[from.file][from.rank]
        chessBoard[from.file][from.rank] = .init(type: .none, color: .none)
        changPlayer()
    }
    
    /// 이동 가능한 범위인지 확인
    private func validateMove(piece: Piece, from: Position, to: Position) -> Bool {
        let distance: MovableRange = .init(file: from.file - to.file, rank: from.rank - to.rank)
        return distance == piece.movableRange
    }
    
    /// 말 이동 가능 여부 파악
    private func move(from: Position, to: Position) -> Bool {
        let currentColor = getPiece(position: from).color
        let nextColor = getPiece(position: to).color
        
        guard currentColor != .none,
              currentColor != nextColor else {
            return false
        }
        
        return true
    }
    
    // MARK: - Method
    
    /// 현재 보드 상태
    private func display() -> [[String]] {
        chessBoard
            .map { file in
                file.map { rank in
                    rank.color.symbol
                }
            }
    }
    
    /// 특정 위치의 말
    private func getPiece(position: Position) -> Piece {
        chessBoard[position.file][position.rank]
    }
    
    /// 순서 변경
    private func changPlayer() {
        player = (player == .white) ? .black : .white
    }
}
