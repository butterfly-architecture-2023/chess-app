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
    case pieceError
    case unableToMoveError
    case helpPosition(positionList: [Position])
    case chessTypeError(pieceColorType: PieceColorType)
    
    func showMessage() -> String {
        switch self {
        case .invalidInputText:
            return "[오류!!] 입력 형식 오류입니다"
        case .splitError:
            return "문자열 분류 중 오류"
        case .regexError:
            return "regex 오류"
        case .pieceError:
            return "current piece 오류"
        case .unableToMoveError:
            return "이동할 수 없는 Position"
        case .helpPosition(let positionList):
            var list: [String] = []
            for position in positionList {
                list.append(position.toString())
            }
            return "\(list)"
        case .chessTypeError(let pieceColorType):
            return "\(pieceColorType.korean())색 체스말의 차례입니다."
        }
    }
}
