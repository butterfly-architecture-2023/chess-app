//
//  Piece.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

protocol Piece {
    var code: String { get }
    var point: Int { get }
    var initialLocations: Set<Position> { get }
    var current: Position? { get set }
    init()
    func possiblePositions() -> Array<Position>
}
