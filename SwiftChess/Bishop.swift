//
//  Bishop.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

protocol Bishop {
    var point: Int { get }
}

extension Bishop {
    var point: Int { 3 }
}

final class BlackBishop : Piece, Bishop, Color {
    var code: String { "♝" }
    var initialLocations: Set<Position>  { [Position(rank: .R1, column: .C),
                                            Position(rank: .R1, column: .F)] }
    var current: Position?
    var color: PieceColor { .black }

    init() {
    }
    
    func possiblePositions() -> Array<Position> {
        guard let current = current else { return [] }
        var result = [Position]()
        let left = Int(current.column.distance(to: .A).magnitude)
        let right = Int(current.column.distance(to: .H).magnitude)
        let top = Int(current.rank.distance(to: .R1).magnitude)
        let bottom = Int(current.rank.distance(to: .R8).magnitude)

        if bottom>0 && right>0 {
            for index in 1...min(bottom, right) {
                let rankIndex = current.rank.advanced(by: index)
                let fileIndex = current.column.advanced(by: index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if top>0 && right>0 {
            for index in 1...min(top, right) {
                let rankIndex = current.rank.advanced(by: -index)
                let fileIndex = current.column.advanced(by: index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if left>0 && bottom>0 {
            for index in 1...min(bottom, left) {
                let rankIndex = current.rank.advanced(by: index)
                let fileIndex = current.column.advanced(by: -index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if left>0 && top>0 {
            for index in 1...min(top, left) {
                let rankIndex = current.rank.advanced(by: -index)
                let fileIndex = current.column.advanced(by: -index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        return result
    }
}

final class WhiteBishop : Piece, Color, Bishop {
    var code: String { "♗" }
    var initialLocations: Set<Position>  { [Position(rank: .R8, column: .C),
                                            Position(rank: .R8, column: .F)] }
    var current: Position?
    var color: PieceColor { .white }

    init() {
    }

    func possiblePositions() -> Array<Position> {
        guard let current = current else { return [] }
        var result = [Position]()
        let left = Int(current.column.distance(to: .A).magnitude)
        let right = Int(current.column.distance(to: .H).magnitude)
        let top = Int(current.rank.distance(to: .R1).magnitude)
        let bottom = Int(current.rank.distance(to: .R8).magnitude)

        if bottom>0 && right>0 {
            for index in 1...min(bottom, right) {
                let rankIndex = current.rank.advanced(by: index)
                let fileIndex = current.column.advanced(by: index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if top>0 && right>0 {
            for index in 1...min(top, right) {
                let rankIndex = current.rank.advanced(by: -index)
                let fileIndex = current.column.advanced(by: index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if left>0 && bottom>0 {
            for index in 1...min(bottom, left) {
                let rankIndex = current.rank.advanced(by: index)
                let fileIndex = current.column.advanced(by: -index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        if left>0 && top>0 {
            for index in 1...min(top, left) {
                let rankIndex = current.rank.advanced(by: -index)
                let fileIndex = current.column.advanced(by: -index)
                result.append(Position(rank: rankIndex, column: fileIndex))
            }
        }
        return result
    }
}
