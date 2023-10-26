//
//  Pawn.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Pawn: Piece {
    let score: Int = 1
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        guard self.isSame(file: position.file) else {
            return false
        }

        guard self.canMove(to: position.rank) else {
            return false
        }
        
        return true
    }
    
    private func isSame(file: File) -> Bool {
        return self.source.file == file
    }
    
    private func canMove(to destinationRank: Rank) -> Bool {
        let currentRank = self.source.rank
        
        guard currentRank.distance(with: destinationRank) == 1 else {
            return false
        }
        
        switch self.color {
        case .black:
            return currentRank < destinationRank
        case .white:
            return currentRank > destinationRank
        }
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return File.allCases.map({ Position(file: $0, rank: .two) })
        case .white:
            return File.allCases.map({ Position(file: $0, rank: .seven) })
        }
    }
}


