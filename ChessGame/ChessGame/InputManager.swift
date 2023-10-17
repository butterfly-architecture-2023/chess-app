//
//  InputManager.swift
//  ChessGame
//
//  Created by 오킹 on 2023/10/18.
//

import Foundation

struct InputManager {
    
    // 프로그래밍 요구사항 6. 체스말은 위치값은 가로 file은 A부터 H까지, 세로 rank는 1부터 8까지 입력이 가능하다.
    func convertToBoardPosition(from text: String) -> (file: Int, rank: Int)? {
        let files = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7] // [input: rank]
        let ranks = [1: 0, 2: 1, 3: 2, 4: 3, 5: 4, 6: 5, 7: 6, 8: 7]                 // [input: file]
        
        guard text.count == 2 else { return nil }
        
        let seperatedText = text.map{ String($0) }
    
         guard let file = files[seperatedText[0]],
               let inputedFile = Int(seperatedText[1]),
               let rank = ranks[inputedFile] else { return nil }
        
        return (file: file, rank: rank)
    }
}
