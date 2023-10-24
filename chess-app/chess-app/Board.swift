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
        
        chessBoard[Rank.two.number] = Array(repeating: blackPwan, count: size)
        chessBoard[Rank.seven.number] = Array(repeating: whitePwan, count: size)
    }
    
    // MARK: - Move Method
    
    /// 말 이동
    func movePiece(piece: Piece, from: Position, to: Position) {
        guard piece.color == player else { return }
        guard validateMovableRange(piece: piece, from: from, to: to) else { return }
        guard validateMove(from: from, to: to) else { return }
        
        chessBoard[to.rank][to.file] = chessBoard[from.rank][from.file]
        chessBoard[from.rank][from.file] = .init(type: .none, color: .none)
        changPlayer()
    }
    
    /// 이동 가능한 범위인지 확인
    func validateMovableRange(piece: Piece, from: Position, to: Position) -> Bool {
        let distance: MovableRange = .init(rank: to.rank - from.rank, file: to.file - from.file)
        return distance == piece.movableRange
    }
    
    /// 말 이동 가능 여부 파악
    private func validateMove(from: Position, to: Position) -> Bool {
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
    func display() -> [[String]] {
        chessBoard
            .map { rank in
                rank.map { file in
                    file.color.symbol
                }
            }
    }
    
    /// 특정 위치의 말
    private func getPiece(position: Position) -> Piece {
        chessBoard[position.rank][position.file]
    }
    
    /// 순서 변경
    private func changPlayer() {
        player = (player == .white) ? .black : .white
    }
}
