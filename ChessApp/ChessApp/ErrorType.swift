//
//  ErrorType.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

enum ErrorType: Error {
    case invalidInputText
    case splitError
    case regexError
    case chessTypeError(pawnType: PieceColorType)
    
    func showMessage() -> String {
        switch self {
        case .invalidInputText:
            return "[오류!!] 입력 형식 오류입니다"
        case .splitError:
            return "문자열 분류 중 오류"
        case .regexError:
            return "regex 오류"
        case .chessTypeError(let pawnType):
            return "\(pawnType.korean())색 체스말의 차례입니다."
        }
    }
}
