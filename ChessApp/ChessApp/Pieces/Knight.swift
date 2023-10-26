//
//  Knight.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Knight: Piece {
    let score: Int = 3
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♞"
        case .white:
            return "♘"
        }
    }
    
    func canMove(to position: Position) -> Bool {
        let distanceOfFile = self.source.file.distance(with: position.file)
        let distanceOfRank = self.source.rank.distance(with: position.rank)
        
        return (distanceOfFile == 2 && distanceOfRank == 1) || (distanceOfFile == 1 && distanceOfRank == 2)
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .B, rank: .one), Position(file: .G, rank: .one)]
        case .white:
            return [Position(file: .B, rank: .eight), Position(file: .G, rank: .eight)]
        }
    }
    
}
