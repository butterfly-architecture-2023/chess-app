//
//  Board.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation


struct Board {
    private var size: Int = 0
    private(set) lazy var chessBoard: [[PawnType]] = Array(repeating: Array(repeating: .none, count: size), count: size)
    private var chessPoint: ChessPoint = ChessPoint(black: 0, white: 0)
    
    init(size: Int) {
        self.size = size
        startBoard()
    }
    
    // MARK: - 체스 프로그램 시작 시, 흑/백 Pawn을 초기화
    private mutating func startBoard() {
        for (offset, _) in chessBoard.enumerated() {
            if offset < 2 {         // 1,2-rank
                chessBoard[offset] = Array(repeating: .black, count: size)
            } else if offset > 5 {  // 7,8-rank
                chessBoard[offset] = Array(repeating: .white, count: size)
            }
        }
    }
    
    // Board는 8x8 크기 체스판에 체스말(Piece) 존재 여부를 관리
    
    // Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력
    func showChessPoint() -> ChessPoint {
        return chessPoint
    }
    
    // Board는 모든 말의 위치를 알 수 있고, display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴
    mutating func display() {
        print("---")
        for row in chessBoard {
            for value in row {
                print(value.rawValue, terminator: " ")
            }
            print()
        }
    }
    
    // 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
    func isUpdateValid() -> Bool {
        return false
    }
    
    // 특정 말을 옮기는 메소드는 Board에서 제공
    mutating func updateBoard(_ positionArray: [Position]) {
        guard let currentPosition = positionArray.first,
              let updatePosition = positionArray.last else { return }
        chessBoard[updatePosition.rank-1][updatePosition.file] = chessBoard[currentPosition.rank-1][currentPosition.file]
        chessBoard[currentPosition.rank-1][currentPosition.file] = .none
    }
}
