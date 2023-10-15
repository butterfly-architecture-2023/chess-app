//
//  Board.swift
//  Chess_game
//
//  Created by 박진섭 on 10/15/23.
//

import Foundation

typealias BoardPosition = (Rank, File)

final class Board {

}

enum Rank: String {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H
}

enum File: String {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
}
