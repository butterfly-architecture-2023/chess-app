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
    private(set) var turn: PieceColor = .white
    
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
            
            piece.initialCoordinates.forEach { coordinate in
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
    
    @discardableResult
    func move(from: PieceCoordinate, to: PieceCoordinate) -> Bool {
        guard
            let movablePiece = piece(at: from),
            turn == movablePiece.color,
            movablePiece.movableCoordinates(from: from).contains(to)
        else { return false }
        
        let targetPiece = piece(at: to)
        
        guard movablePiece.color != targetPiece?.color else { return false }
        
        squares[from.rank.rawValue][from.file.rawValue] = nil
        squares[to.rank.rawValue][to.file.rawValue] = movablePiece
        
        turn = (turn == .white) ? .black : .white
        
        return true
    }
    
    func getScore() -> (black: Int, white: Int) {
        var (blackScore, whiteScore) = (0, 0)
        
        for rank in squares {
            for file in rank {
                guard let piece = file else { continue }
                
                piece.color == .black
                ? (blackScore += piece.point)
                : (whiteScore += piece.point)
            }
        }
        
        return (black: blackScore, white: whiteScore)
    }
}

// MARK: - private method

extension Board {
    
    private func piece(at: PieceCoordinate) -> (any Piece)? {
        guard let piece = squares[at.rank.rawValue][at.file.rawValue] else { return nil }
        
        return piece
    }
}
