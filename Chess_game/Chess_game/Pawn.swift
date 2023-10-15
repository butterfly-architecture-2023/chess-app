//
//  Pawn.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

protocol Pawn {
    var type: PawnType { get }
    var isAlive: Bool { get set }
    var position: BoardPosition { get set }
    init(position: BoardPosition)
}

struct BlackPawn: Pawn {
    var type: PawnType = .black
    var isAlive: Bool = true
    var position: BoardPosition

    init(position: BoardPosition) {
        self.position = position
    }
}

struct WhitePawn: Pawn {
    var type: PawnType = .white
    var isAlive: Bool = true
    var position: BoardPosition

    init(position: BoardPosition) {
        self.position = position
    }
}

enum PawnType {
    case black
    case white
}
