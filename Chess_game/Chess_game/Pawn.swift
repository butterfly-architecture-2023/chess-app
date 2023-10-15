//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

struct Pawn {
    var isAlive: Bool = true
    let type: PawnType

    init(type: PawnType) {
        self.type = type
    }
}


enum PawnType {
    case black
    case white
}
