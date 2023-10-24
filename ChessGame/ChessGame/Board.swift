//
//  Board.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/17.
//

import Foundation

final class Board {
    
    private var pieces: [Position: Piece]
    
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
        var square = Array(repeating: Array(repeating: ".", count: 8), count: 8)
        
        pieces.forEach { (position, piece) in
            square[position.file][position.rank] = piece.description
        }
        
        return square
    }
    
    // 프로그래밍 요구사항 4.
    // 게임 시작시점에는 특정 위치에 특정 말을 생성한다.
    // 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
    // 체스말 초기 위치가 아니면 생성하지 않는다.
    // 이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
    // 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
    // Pawn는 색상별로 8개만 가능하다.
    func gameStart() {
        
        // 초기화
//        self.square =  Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        
//        // 폰들 초기화
//        square[1] = square[1].map{ _ in Piece(category: .pawn(color: .black)) }
//        square[6] = square[6].map{ _ in Piece(category: .pawn(color: .white)) }
    }
    
    // 프로그래밍 요구사항 5.
    // 특정 말을 옮기는 메소드는 Board에서 제공한다.
    // 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
    // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
    // 만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
    func movePawn(current: Position) -> Bool {
//        let piece = square[current.rank][current.file]
//        let newRank: Int
//        
//        switch piece.category {
//        case .pawn(color: .black):
//            newRank = current.rank + 1
//        case .pawn(color: .white):
//            newRank = current.rank - 1
//        case .empty:
//            return false
//        }
//        
//        guard isValidMove(piece: piece, position: Position(file: current.file, rank: newRank)) else {
//            return false
//        }
//        
//        square[newRank][current.file] = piece
//        square[current.rank][current.file] = Piece(category: .empty)

        return true
    }

    private func isValidMove(piece: Piece, position: Position) -> Bool {
//        guard position.rank >= 0,
//              position.rank < square.count,
//              square[position.rank][position.file].category != piece.category else { return false }
        
        return true
    }
}

struct Square {
    private var pieces: [Position: Piece] = [:]
    private var map: [[Piece?]]

    init(column: Int, row: Int) {
        self.map = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }
}
