//
//  main.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

var board: [[PawnType]] = Array(repeating: Array(repeating: .none, count: 8), count: 8)

func main() {
    
    // MARK: - 체스 시작 초기화
    // "체스 보드를 초기화했습니다." 출력
    // 8 x 8 board 초기화 (1,2-rank는 흑색 체스말이, 7,8-rank는 백색 체스말이 위치)
    
    for (offset, _) in board.enumerated() {
        if offset < 2 { // 1,2-rank
            board[offset] = Array(repeating: .black, count: 8)
        } else if offset > 5 { // 7,8-rank
            board[offset] = Array(repeating: .white, count: 8)
        }
    }
    // 체스 보드 출력
    // "명령을 입력하세요>" 출력
    
    
    // MARK: - [입력, 검증] 체스 이동할 Pawn 현재 위치 & 이동할 위치 입력 받기 (ex, A2->A3)
    // 형식에 맞지 않으면 다시 입력
    // 백색부터 시작 -> 처음 입력된 pawn 흑색이면 "백색 체스말의 차례입니다." 출력
    
    
    // MARK: - [처리/계산] board 저장값 수정
    printBoard()
    updateBoard(currentPosition: Position(rank: "A", file: 2), updatePosition: Position(rank: "A", file: 3))
//    board[A][3] = board[A][2]
    printBoard()
    
    
    // MARK: - [형식, 출력] 수정된 board 출력
    // 상대편 말을 잡는 경우 수정된 board 출력
}

main()

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
