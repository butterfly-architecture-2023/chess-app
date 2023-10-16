//
//  PieceType.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/17.
//

import Foundation

enum PieceType {
    case pawn
    
    var maxCount: Int {
        switch self {
        case .pawn:
            return 8
        }
    }
}
