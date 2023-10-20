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
    }
    
    // MARK: - 입력값 분리 ("->"기준)
    mutating func checkInputFormat() throws {
        let inputArray = inputText.split(separator: "->")
        let currentText = String(inputArray.first ?? "")
        let updateText = String(inputArray.last ?? "")
        
        do {
            let currentPosition = try makeTextToPosition(currentText)
            let updatePosition = try makeTextToPosition(updateText)
            positionInfo = [currentPosition, updatePosition]
        } catch {
            throw ErrorType.invalidInputText
        }
    }
    
    
    // MARK: - Text -> Position type 변환
    private func makeTextToPosition(_ textPosition: String) throws -> Position {
        if textPosition.count > 2 { throw ErrorType.invalidInputText }
        if let col = textPosition.first, let row = textPosition.last {
            return Position(rank: String(row), file: String(col))
        }
        return Position(rank: 0, file: 0)
    }
}
