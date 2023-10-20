//
//  Board.swift
//  ChessApp
//
//  Created by leeyeon2 on 10/17/23.
//

import Foundation

// 체스보드
class Board {
    let rank = 8 //행
    let file = 8 //열
    
    // 첫시작은 백마
    var playerTurn = Pawn.white
    
    lazy var board = Array(repeating: Array(repeating: ".", count: file), count: rank)
    
    init(playerTurn: String = Pawn.white) {
        self.playerTurn = playerTurn
        
        // 특정 위치에 특정 말을 생성
        for i in 0..<file{
            //white pawn setting - 7rank
            board[1][i] = Pawn.black
            board[6][i] = Pawn.white
        }
//        printBoard()
    }
    
    /// 말 이동 메소드
    /// - Parameters:
    ///   - current: 현재 위치
    ///   - next: 다음 위치
    /// - Returns: 이동 가능 여부
    func moveToNext(current:String, next: String) -> Bool {
        // 입력받은 위치들이 현재 맵안에 있는지 검증
        let inputCurrentArr = stringToLocation(input: current)
        for input in inputCurrentArr {
            if input < 0 || input >= rank {
                print("보드의 범위를 벗어남")
                return false
            }
        }
        
        let inputNextArr = stringToLocation(input: next)
        for input in inputNextArr {
            if input < 0 || input >= rank {
                print("보드의 범위를 벗어남")
                return false
            }
        }
        
        // 입력받은 말 검증
        // 1. 현재 턴인 말인 경우
        if board[inputCurrentArr[0]][inputCurrentArr[1]] == playerTurn {
            // 2. 입력받은 다음위치가 현재 위치에서 이동할 수 있는 위치인 경우
            let nextLocation = Pawn.nextLocation(currentLocation: inputCurrentArr, board: board)
            if nextLocation == inputNextArr {
                if board[inputNextArr[0]][inputNextArr[1]] != playerTurn {
                    // 3. 다음 위치에 같은 색상의 말이 없는 경우
                    //보드판 업데이트
                    updateBoard(current:inputCurrentArr, next: inputNextArr)
                    
                    // 순서 변경
                    playerTurn = (playerTurn == Pawn.white) ? Pawn.black : Pawn.white
                    return true
                }else{
                    print("이미 말이 놓이 위치 입니다.")
                    return false
                }
            }else{
                print("한 칸만 이동 가능합니다.")
                return false
            }
        }else{
            let playerTurnStr = (playerTurn == Pawn.white) ? "white" : "black"
            print("\(playerTurnStr)말 차례입니다.")
            return false
        }
    }

    /// 보드판 업데이트
    /// - Parameters:
    ///   - current: 기존 위치
    ///   - next: 이동 위치
    func updateBoard(current:[Int], next: [Int]) {
        //현재위치 점으로
        board[current[0]][current[1]] = "."
        //새위치 말로
        board[next[0]][next[1]] = playerTurn
    }

    /// 현재 점수 출력
    func countScore() {
        let blackScore = board.flatMap { $0.filter { $0 == Pawn.black} }.count
        let whiteScore = board.flatMap { $0.filter { $0 == Pawn.white} }.count
        print("blackScore : \(blackScore), whiteScore : \(whiteScore)")
    }
    
    func countBlackScore() -> Int{
        let blackScore = board.flatMap { $0.filter { $0 == Pawn.black} }.count
        return blackScore
    }

    func countWhiteScore() -> Int{
        let whiteScore = board.flatMap { $0.filter { $0 == Pawn.white} }.count
        return whiteScore
    }
    
    /// 보드판 출력
    func printBoard() {
        for line in board {
            print(line.joined(separator: ""))
        }
    }
    
    /// 문자열 배열로 보드 위에 체스말을 리턴한다
    /// - Returns: 문자열 배열 보드
    func display() -> [[String]]{
        return board
    }
    
    /// 입력받은 위치 타입 형변환
    /// - Parameter input: string 타입 위치
    /// - Returns: Int형 Array 타입 위치
    func stringToLocation(input: String) -> [Int] {

        let inputArr = Array(input.uppercased())
        //행
        var res = [Int]()
        res.append(Int(String(inputArr[1]))!-1)
        
        //열
        switch inputArr[0]{
        case "A":
            res.append(0)
        case "B":
            res.append(1)
        case "C":
            res.append(2)
        case "D":
            res.append(3)
        case "E":
            res.append(4)
        case "F":
            res.append(5)
        case "G":
            res.append(6)
        case "H":
            res.append(7)
        default:
            //범위 벗어난 값
            res.append(rank+1)
        }
        return res
    }
}
