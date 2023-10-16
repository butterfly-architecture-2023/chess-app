//
//  main.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

func main() {
    
    // MARK: - 체스 시작 초기화
    // "체스 보드를 초기화했습니다." 출력
    // 8 x 8 board 초기화 (1,2-rank는 흑색 체스말이, 7,8-rank는 백색 체스말이 위치)
    
    let boardManager = BoardManager(size: 8)
    // 체스 보드 출력
    // "명령을 입력하세요>" 출력
    
    
    // MARK: - [입력, 검증] 체스 이동할 Pawn 현재 위치 & 이동할 위치 입력 받기 (ex, A2->A3)
    // 형식에 맞지 않으면 다시 입력
    // 백색부터 시작 -> 처음 입력된 pawn 흑색이면 "백색 체스말의 차례입니다." 출력
    
    
    // MARK: - [처리/계산] board 저장값 수정
    boardManager.printBoard()
    boardManager.updateBoard(currentPosition: Position(rank: "A", file: 2), updatePosition: Position(rank: "A", file: 3))
//    board[A][3] = board[A][2]
    boardManager.printBoard()
    
    
    // MARK: - [형식, 출력] 수정된 board 출력
    // 상대편 말을 잡는 경우 수정된 board 출력
}

main()
