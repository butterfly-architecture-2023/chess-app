//
//  BoardManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

class BoardManager {
    private var size: Int = 0
    private(set) lazy var board: [[PawnType]] = Array(repeating: Array(repeating: .none, count: size), count: size)
    
    init(size: Int) {
        self.size = size
        startBoard()
    }
    
    
    // MARK: - 체스 프로그램 시작 시, 흑/백 Pawn을 초기화
    private func startBoard() {
        for (offset, _) in board.enumerated() {
            if offset < 2 {         // 1,2-rank
                board[offset] = Array(repeating: .black, count: 8)
            } else if offset > 5 {  // 7,8-rank
                board[offset] = Array(repeating: .white, count: 8)
            }
        }
    }
    
    /*
     같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
     말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
     만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
     */
    func updateBoard(currentPosition: Position, updatePosition: Position) {
        board[updatePosition.file-1][updatePosition.rank] = board[currentPosition.file-1][currentPosition.rank]
        board[currentPosition.file-1][currentPosition.rank] = .none
    }

    // FIXME: - 확인을 위한 임시 출력
    func printBoard() {
        print("---")
        for row in board {
            for value in row {
                print(value.rawValue, terminator: " ")
            }
            print()
        }
    }
}
