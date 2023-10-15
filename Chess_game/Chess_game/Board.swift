//
//  Board.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

typealias BoardPosition = (Rank, File)

final class Board {
    private var white: [Pawn] = []
    private var black: [Pawn] = []

    func resetPawns() {
        let whitePawns = File.allCases.map { WhitePawn(position: (.seven, $0)) }
        let blackPawns = File.allCases.map { BlackPawn(position: (.two, $0)) }
        self.white = whitePawns
        self.black = blackPawns
    }

    func getPoint(_ pawnType: PawnType) -> Int {
        switch pawnType {
        case .black:
            return white.filter { $0.isAlive == false }.count
        case .white:
            return black.filter { $0.isAlive == false }.count
        }
    }

}

enum Rank: String {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
}

enum File: String, CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
}
