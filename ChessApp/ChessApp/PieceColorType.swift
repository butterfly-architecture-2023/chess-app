//
//  PawnType.swift
//  ChessApp
//
//  Created by elly on 10/16/23.
//

import Foundation

enum PieceColorType: String {
    case black
    case white
    
    func korean() -> String {
        switch self {
            case .black:
                return "흑"
            case .white:
                return "백"
        }
    }
}
