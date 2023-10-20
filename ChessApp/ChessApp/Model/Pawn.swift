//
//  Pawn.swift
//  ChessApp
//
//  Created by leeyeon2 on 10/17/23.
//

import Foundation

// 체스 말 관리
struct Pawn {
    static let black = "\u{265F}"
    static let white = "\u{2659}"
    
    // 말의 다음 위치 제공(이동 가능 위치)
    static func nextLocation(currentLocation: [Int], board: [[String]]) -> [Int] {
        
        var nextLocation = [Int]()

        // 궁금증 : board를 클래스로 계속 생성해서 가져오는게 문제
        for input in currentLocation {
            if input < 0 || input >= board.count {
                print("보드의 범위를 벗어남")
                return []
            }
        }
        
        let inputPawn = board[currentLocation[0]][currentLocation[1]]
        
        // 색에 따라 다음 위치 분기
        // black > rank 증가
        // white > rank 감소
        let dBlack = [1,0]
        let dWhite = [-1,0]

        if inputPawn == black{
            //black pawn next location
            for i in 0..<currentLocation.count{
                let rBlack = currentLocation[i] + dBlack[i]
                nextLocation.append(rBlack)
            }
            
        }else{
            //white pawn next location
            for i in 0..<currentLocation.count{
                let rWhite = currentLocation[i] + dWhite[i]
                nextLocation.append(rWhite)
            }
        }
        
        return nextLocation
    }
}
