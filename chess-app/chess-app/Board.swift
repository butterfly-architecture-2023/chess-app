//
//  Board.swift
//  chess-app
//
//  Created by 윤소희 on 2023/10/15.
//

import Foundation

class Board {
    
    let blackPawn = "\u{265F}"
    let whitePawn = "\u{2659}"
    var blackScore: Int = 0
    var whiteScore: Int = 0
    var board = Array(repeating: Array(repeating: ".", count: 8), count:8)
    
    func resetBoard() {
        board = Array(repeating: Array(repeating: ".", count: 8), count:8)
        board[1] = Array(repeating: blackPawn, count: 8)
        board[6] = Array(repeating: whitePawn, count: 8)
    }
    
    func resetScore() {
        blackScore = 8
        whiteScore = 8
    }
    
    func movePawn(from:String, to:String, turn:Int) -> Bool {
        
        var isPossible: Bool = true
        
        let inputFrom = from.split(separator: "")
        let inputTo = to.split(separator: "")
        let fromFile = Int(UnicodeScalar(String(inputFrom[0]))!.value)-65
        let toFile = Int(UnicodeScalar(String(inputTo[0]))!.value)-65
        let fromRank = Int(inputFrom[1])! - 1
        let toRank = Int(inputTo[1])! - 1
        
        //입력값 경계 설정
        if fromFile < 0 || fromFile > 7 || fromRank < 0 || fromRank > 7 || toFile < 0 || toFile > 7 || toRank < 0 || toRank > 7 {
            return false
        }
        
        //가로로 움직일 수 없도록
        if fromFile != toFile {
            return false
        }
        
        if turn % 2 == 1 {// 흑색말
            //같은색일경우
            if board[toRank][toFile] == "\u{265F}" {
                return false
            } else if board[toRank][toFile] == "\u{2659}" {
                board[toRank][toFile] = "\u{265F}"
            }
            //작은 rank에서 더 큰 rank로 움직이도록
            if toRank - fromRank != 1 {
                return false
            }
        }
        
        if turn % 2 == 0 {// 백색말
            //같은색일경우
            if board[toRank][toFile] == "\u{2659}" {
                return false
            } else if board[toRank][toFile] == "\u{265F}" {
                board[toRank][toFile] = "\u{2659}"
            }
            //큰 rank에서 더 작은 rank로 움직이도록
            if fromRank - toRank != 1 {
                return false
            }
        }
        
        return isPossible
    }
}

