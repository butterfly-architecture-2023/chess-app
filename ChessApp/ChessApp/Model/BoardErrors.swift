//
//  BoardErrors.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/21.
//

import Foundation

enum BoardValidateError: Error {
    case exceedMaximumCount
}

enum BoardMoveError: Error {
    case sameColor
    case invalidDestination
}
