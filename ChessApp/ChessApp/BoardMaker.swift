//
//  BoardMaker.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct BoardMaker {
    static func make() -> [Rank: [File: Piece?]] {
        var squares: [Rank: [File: Piece?]] = [:]
        
        for rank in Rank.allCases {
            var squaresPerRank: [File: Piece?] = [:]
            
            for file in File.allCases {
                let piece = _piece(for: rank)
                squaresPerRank.updateValue(piece, forKey: file)
            }
            
            squares.updateValue(squaresPerRank, forKey: rank)
        }
        
        return squares
    }
    
    private static func _piece(for rank: Rank) -> Piece? {
        if rank == .two {
            return Pawn(color: .black)
        }
        
        if rank == .seven {
            return Pawn(color: .white)
        }
        
        return nil
    }
}
