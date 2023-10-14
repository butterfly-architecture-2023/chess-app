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
                let square = Square(rank: rank, file: file)
                squares.append(square)
            }
        }
        
        return squares
    }
}
