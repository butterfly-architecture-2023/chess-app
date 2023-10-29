//
//  Board.swift
//  ChessGame
//
//  Created by Dongyoung Kwon on 2023/10/17.
//

import Foundation

final class Board {
    
    // MARK: - property
    
    // PRIVATE
    private var squares: [[(any Piece)?]] = []
    
    // MARK: - initialize
    
    init() {
        let emptyRank = [(any Piece)?].init(repeating: nil, count: 8)
        self.squares = [[(any Piece)?]].init(repeating: emptyRank, count: 8)
    }
}

// MARK: - internal method

extension Board {
    
    func setUpPieces(type: Piece.Type) {
        for color in PieceColor.allCases {
            let piece = type.init(color: color)
            
            piece.initialPositions.forEach { coordinate in
                self.squares[coordinate.rank.rawValue][coordinate.file.rawValue] = piece
            }
        }
    }
    
    func display() -> [String] {
        var result: [String] = []
        
        for rank in squares {
            var pieces = ""
            
            for file in rank {
                switch file {
                case .some(let piece):
                    pieces += piece.symbol
                case .none:
                    pieces += "."
                }
            }
            
            result.append(pieces)
        }
        
        return result
    }
}

// MARK: - private method

extension Board {
    
}
