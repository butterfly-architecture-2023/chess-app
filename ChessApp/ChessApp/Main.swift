//
//  main.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

func main() {
    // MARK: - 체스 시작 초기화
    let printManager = PrintManager()
    printManager.showDescription(.initBoard)
    var board: Board = Board(size: 8)
    
    // 초기 체스 보드 출력
    printManager.showChessBoard(board.display())
    
    
    repeat {
        
        // MARK: - 입력
        printManager.showDescription(.inputText)
        let inputText = readLine() ?? ""
        var inputManager = InputManager()
        
        do {
            // MARK: - 검증
            // - 형식에 맞는가? "OO->OO" or "?OO"인가
            let inputFormatType = try inputManager.checkFormatType(inputText)
            
            // - inputText를 분류하고, Position 형식으로 변환
            let positionInfo = inputManager.makePositionList(inputText, inputFormatType)
            
            // - currentPosition 값이 게임 순서와 맞는지 체크
            try board.checkGameTurn(positionInfo)
            
            // - 이동이 가능한지 체크
            try board.checkMovable(positionInfo, inputFormatType)
            
            
            // MARK: - [처리/계산] board 저장값 수정
            board.updateBoard(positionInfo)
            
            
            // MARK: - [형식, 출력] 수정된 board 출력
            // 상대편 말을 잡는 경우 수정된 board 출력
            printManager.showChessBoard(board.display())
            
        } catch let error {
            guard let error = error as? ErrorType else { return }
            print(error.showMessage())
        }
    } while(true)
}

main()
