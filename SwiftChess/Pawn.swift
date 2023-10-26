//
//  Pawn.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

protocol Pawn {
    var point: Int { get }
}

extension Pawn {
    var point: Int { 1 }
}

final class BlackPawn : Piece, Pawn {
    var code: String { "♟" }
    var initialLocations: Set<Position>  { [Position(rank: .R2, column: .A),
                                            Position(rank: .R2, column: .B),
                                            Position(rank: .R2, column: .C),
                                            Position(rank: .R2, column: .D),
                                            Position(rank: .R2, column: .E),
                                            Position(rank: .R2, column: .F),
                                            Position(rank: .R2, column: .G),
                                            Position(rank: .R2, column: .H)] }
    var current: Position?
    
    init() {
    }
    
    func possiblePositions() -> Array<Position> {
        guard let current = current else { return [] }
        var result = [Position]()
        let bottom = Int(current.rank.distance(to: .R8).magnitude)
        if bottom>0 {
            result.append(Position(rank: current.rank.advanced(by: 1), column: current.column))
        }
        return result
    }
}

extension BlackPawn : Color {
    var color: PieceColor { .black }
}

final class WhitePawn : Piece, Color, Pawn {
    var code: String { "♙" }
    var initialLocations: Set<Position>  { [Position(rank: .R7, column: .A),
                                            Position(rank: .R7, column: .B),
                                            Position(rank: .R7, column: .C),
                                            Position(rank: .R7, column: .D),
                                            Position(rank: .R7, column: .E),
                                            Position(rank: .R7, column: .F),
                                            Position(rank: .R7, column: .G),
                                            Position(rank: .R7, column: .H)] }
    var current: Position?
    var color: PieceColor { .white }    //과연 필요한가?

    init() {
    }

    func possiblePositions() -> Array<Position> {
        guard let current = current else { return [] }
        var result = [Position]()
        let top = Int(current.rank.distance(to: .R1).magnitude)
        if top>0 {
            result.append(Position(rank: current.rank.advanced(by: -1), column: current.column))
        }
        return result
    }
}
