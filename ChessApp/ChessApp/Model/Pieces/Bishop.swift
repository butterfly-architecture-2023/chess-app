//
//  Bishop.swift
//  ChessApp
//
//  Created by 현기엽 on 2023/10/20.
//

import Foundation

struct Bishop: Piece {
    let color: Color
    
    func availableMovePositions(for position: Position) -> Set<Position> {
        []
    }
    
    let maximumCount: Int = 2
    let score: Int = 3
}

extension Bishop: CustomStringConvertible {
    var description: String { "" }
}
