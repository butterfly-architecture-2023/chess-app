//
//  ValidationError.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

enum ValidationError: Error {
    case sourceNotExist
    case invalidTurn
    case invalidScope
    case sameTeam
}
