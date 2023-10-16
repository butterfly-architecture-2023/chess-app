//
//  InputManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

struct InputManager {
    private var inputText: String = ""
    private(set) var positionInfo: [Position] = []
    
    init(inputText: String) {
        self.inputText = inputText
        checkInputFormat()
    }
    
    // MARK: - 입력값 분리 ("->"기준)
    private mutating func checkInputFormat() {
        let inputArray = inputText.split(separator: "->")
        let currentPosition = String(inputArray.first ?? "")
        let updatePosition = String(inputArray.last ?? "")
        
        positionInfo = [makeTextToPosition(currentPosition), makeTextToPosition(updatePosition)]
    }
    
    
    // MARK: - Text -> Position type 변환
    private func makeTextToPosition(_ textPosition: String) -> Position {
        guard let col = textPosition.first, let row = textPosition.last else { return Position(rank: 0, file: 0) }
        return Position(rank: String(row), file: String(col))
    }
}
