//
//  InputManager.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

struct InputManager {
    
    /// Input 형식에 맞는지 체크하여 어떤 FormatType인지 리턴
    /// - Parameter input: 입력된 String Type 값
    /// - Returns: RegexFormatType
    func checkFormatType(_ input: String) throws -> RegexFormatType {
        if let _ = input.range(of: RegexFormatType.updatePiece.pattern, options: .regularExpression) {
            return .updatePiece
        } else if let _ = input.range(of: RegexFormatType.help.pattern, options: .regularExpression) {
            return .help
        } else {
            throw ErrorType.invalidInputText
        }
    }
    
    /// 입력된 값을 분류하여 [Position] 형태로 리턴
    /// - Parameters:
    ///   - input: 입력된 String Type 값
    ///   - type: RegexFormatType
    /// - Returns: [Position]
    mutating func makePositionList(_ input: String, _ type: RegexFormatType) -> [Position] {
        // - type에 따라 값 분류 [String]값으로 전달
        let result = splitText(input, type)
        var positionTextArray: [String] = []
        switch result {
            case .success(let data):
                positionTextArray = data
            case .failure(let error):
                // currentPosition, updatePosition으로 변환 오류
                print(error.showMessage())
        }
        
        // [String] -> [Position] 변환
        return positionTextArray.compactMap { makeTextToPosition($0) }
    }
    
    private func splitText(_ input: String, _ type: RegexFormatType) -> Result<[String], ErrorType> {
        do {
            let regex = try NSRegularExpression(pattern: type.pattern)
            switch type {
                case .updatePiece:
                    if let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) {
                        if let range1 = Range(match.range(at: 1), in: input),
                           let range2 = Range(match.range(at: 2), in: input) {
                            return .success([String(input[range1]), String(input[range2])])
                        }
                    }
                case .help:
                    if let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) {
                        if let range1 = Range(match.range(at: 1), in: input) {
                            return .success([String(input[range1])])
                        }
                    }
            }
        } catch {
            return .failure(ErrorType.regexError)
        }
        return .failure(ErrorType.splitError)
    }
    
    
    // MARK: - Text -> Position type 변환
    private func makeTextToPosition(_ textPosition: String) -> Position {
        if let col = textPosition.first, let row = textPosition.last {
            return Position(rank: String(row), file: String(col))
        }
        return Position(rank: 0, file: 0)
    }
}

enum RegexFormatType: String {
    case updatePiece = "([A-H]{1}[0-8]{1})->([A-H]{1}[0-8]{1})"
    case help = "\\?([A-H]{1}[0-8]{1})"
    
    var pattern: String {
        return self.rawValue
    }
}
