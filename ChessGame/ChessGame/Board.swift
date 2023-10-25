//
//  Board.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/17.
//

import Foundation

final class Board {
    
    private var pieces: [Position: Piece] {
        didSet {
            updateSquare()
        }
    }
    
    private var square: [[Piece?]] = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    
    init(pieces: [Position: Piece]) {
        self.pieces = pieces
    }
    
    convenience init() {
        self.init(pieces: [:])
    }
    
    // 프로그래밍 요구사항 1. 체스말(Piece) 존재 여부
    var hasPieces: Bool {
        return !pieces.isEmpty
    }
    
    // 프로그래밍 요구사항 2. 흑과 백 점수를 출력
    func score() -> (black: Int, white: Int) {
        
        var score = (black: 0, white: 0)
        
        pieces.forEach { (position, piece) in
            let pieceType = type(of: piece)
            pieceType.color == .black ? (score.black += pieceType.score) : (score.white += pieceType.score)
        }

        return score
    }
    
    // 프로그래밍 요구사항 3.
    // Board는 모든 말의 위치를 알 수 있고, display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴한다
    // 흑색 Pawn는 ♟ U+265F를 빈 곳은 "."을 표시한다.
    // 백색 Pawn는 ♙ U+2659를 빈 곳은 "."을 표시한다.
    func display() -> [[String]] {
        
        pieces.forEach { (position, piece) in
            self.square[position.file][position.rank] = piece
        }

        return self.square.map { $0.map { $0?.description ?? "." }}
    }
    
    private func reset() {
        pieces = [:]
        square = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }
    
    private func updateSquare() {
        square = Array(repeating: Array(repeating: nil, count: 8), count: 8)
        
        pieces.forEach { (position, piece) in
            self.square[position.file][position.rank] = piece
        }
    }
    
    // 프로그래밍 요구사항 4.
    // 게임 시작시점에는 특정 위치에 특정 말을 생성한다.
    // 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
    // 체스말 초기 위치가 아니면 생성하지 않는다.
    // 이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
    // 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
    // Pawn는 색상별로 8개만 가능하다.
    func gameStart() {

        reset()
        
        let pieceTypes: [any Piece.Type] = [BlackPawn.self, BlackRook.self,
                                            BlackKnight.self, BlackRook.self,
                                            BlackQueen.self, BlackBiship.self,
                                            WhitePawn.self, WhiteRook.self,
                                            WhiteKnight.self, WhiteRook.self,
                                            WhiteQueen.self, WhiteBiship.self]
        
        pieceTypes.forEach { pieceType in
            self.pieces += pieceType.initialPositions()
        }
    }
    
    // 프로그래밍 요구사항 5.
    // 특정 말을 옮기는 메소드는 Board에서 제공한다.
    // 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
    // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
    // 만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
    func movePiece(from: Position, to: Position) -> Bool {
        
        guard isValidMove(from: from, to: to) else { return false }
        
        pieces[to] = pieces[from]
        pieces[from] = nil

        return true
    }

    private func isValidMove(from: Position, to: Position) -> Bool {
        
        // from 위치의 체스말 존재 여부 검사
        guard let startPositionPiece = pieces[from] else { return false }
        
        // to 위치의 체스말이 존재 여부 검사
        if let endPositionPiece = pieces[to] {
            // 체스말 색 검사
            if type(of: startPositionPiece).color == type(of: endPositionPiece).color {
                return false
            }
        }
        
        let canMove = startPositionPiece.movablePositions(current: from).contains(to)

        return canMove
    }
}

struct Square {
    private var pieces: [Position: Piece] = [:]
    private var map: [[Piece?]]

    init(column: Int, row: Int) {
        self.map = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }
}
