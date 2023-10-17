//
//  BoardMaker.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct BoardMaker {
    static func make() -> [Board.Rank: [Board.File: Piece?]] {
        var squares: [Board.Rank: [Board.File: Piece?]] = [:]
        
        for rank in Board.Rank.allCases {
            var squaresPerRank: [Board.File: Piece?] = [:]
            
            for file in Board.File.allCases {
                let piece = _piece(for: rank)
                squaresPerRank.updateValue(piece, forKey: file)
            }
            
            squares.updateValue(squaresPerRank, forKey: rank)
        }
        
        return squares
    }
    
    private static func _piece(for rank: Board.Rank) -> Piece? {
        if rank == .two {
            return Pawn(color: .black)
        }
        
        if rank == .seven {
            return Pawn(color: .white)
        }
        
        return nil
    }
}
