//
//  InputManager.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct InputManager {
    private let separator: String
    
    init(separator: String) {
        self.separator = separator
    }
    
    func makeFormattedInputs(from userInput: String) throws -> (source: Position, destination: Position) {
        let inputs = userInput.split(separator: self.separator)
        
        guard inputs.count == 2 else {
            throw InputError.invalidSeparator
        }
        
        guard let source = self.makePosition(from: String(inputs[0])),
              let destination = self.makePosition(from: String(inputs[1])) else {
            
            throw InputError.overRange
        }
        
        return (source: source, destination: destination)
    }
    
    private func makePosition(from input: String) -> Position? {
        guard let file = File(input[input.startIndex]),
              let rankNum = Int(String(input[input.index(input.startIndex, offsetBy: 1)])),
              let rank = Rank(rawValue: rankNum) else {
            return nil
        }
        
        return Position(file: file, rank: rank)
    }
}

