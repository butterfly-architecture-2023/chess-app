//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

final class Pawn {
    private let type: PawnType
    var isAlive: Bool = true
    var position: BoardPosition

    init(type: PawnType, position: BoardPosition) {
        self.type = type
        self.position = position
    }
}

enum PawnType {
    case black
    case white
}
