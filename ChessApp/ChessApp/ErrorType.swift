//
//  ErrorType.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

enum ErrorType: Error {
    case invalidInputText
    case chessTypeError(pawnType: PieceColorType)
    
    func showMessage() -> String {
        switch self {
        case .invalidInputText:
            return "[오류!!] 입력 형식 오류입니다"
        case .chessTypeError(let pawnType):
            return "\(pawnType.korean())색 체스말의 차례입니다."
        }
    }
}
