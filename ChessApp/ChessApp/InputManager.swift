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
    
    func makeFormattedInputs(from userInput: String) throws -> (source: Location, destination: Location) {
        let inputs = userInput.split(separator: "->")
        
        guard let source = self.makeLocation(from: String(inputs[0])),
              let destination = self.makeLocation(from: String(inputs[1])) else {
            
            throw InputError.overRange
        }
        
        return (source: source, destination: destination)
    }
    
    private func makeLocation(from input: String) -> Location? {
        if input.count != 2 {
            return nil
        }
        
        guard let file = File(input[input.startIndex]),
              let rankNum = Int(String(input[input.index(input.startIndex, offsetBy: 1)])),
              let rank = Rank(rawValue: rankNum) else {
            return nil
        }
        
        return Location(file: file, rank: rank)
    }
}

