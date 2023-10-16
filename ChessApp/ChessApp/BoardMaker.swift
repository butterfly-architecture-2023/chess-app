//
//  BoardMaker.swift
//  ChessApp
//
//  Created by 김혜지 on 10/15/23.
//

struct BoardMaker {
    static func make() -> [Square] {
        var squares: [Square] = []
        
        for rank in Board.Rank.allCases {
            for file in Board.File.allCases {
                let piece = _piece(for: rank)
                let square = Square(rank: rank, file: file, piece: piece)
                squares.append(square)
            }
        }
        
        return squares
    }
    
    private static func _piece(for rank: Board.Rank) -> Piece? {
        if rank == .two {
            return Piece(color: .black)
        }
        
        if rank == .seven {
            return Piece(color: .white)
        }
        
        return nil
    }
}
