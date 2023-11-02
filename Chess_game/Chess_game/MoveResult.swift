//
//  MoveResult.swift
//  Chess_game
//
//  Created by 박진섭 on 11/2/23.
//

struct MoveResult {
    let pieces: [Piece]
    let teamScore: TeamScore
}

struct TeamScore: Equatable {
    let black: Int
    let white: Int
}
