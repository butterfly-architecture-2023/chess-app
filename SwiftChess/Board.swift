//
//  Board.swift
//  SwiftChess
//
//  Created by JK on 2022/06/23.
//

import Foundation

class GameBoard {
    static let LimitByPiece : Dictionary<ObjectIdentifier, Int>
        = [ObjectIdentifier(WhitePawn.self):8, ObjectIdentifier(BlackPawn.self):8,
           ObjectIdentifier(WhiteBishop.self):2, ObjectIdentifier(BlackBishop.self):2, ]
    
    enum GameError : Error {
        case pieceNotFound
        case mismatchOfColor
    }
    
    private var board : [[Piece?]]
    private(set) var turn : PieceColor = .white
    
    init() {
        let emptyRank = [Piece?].init(repeating: nil, count: 8)
        board = [[Piece?]].init(repeating: emptyRank, count: 8)
    }

    private func convertToIndex(position: Position) -> (column: Int, row:Int) {
        return (column: position.column.rawValue, row: position.rank.rawValue)
    }
    
    private func locate(piece: Piece, at: Position) -> Bool {
        guard piece.initialLocations.contains(at) else { return false }
        let index = convertToIndex(position: at)
        board[index.row][index.column] = piece
        return true
    }
    
    private func piece(at: Position) -> Piece? {
        let index = convertToIndex(position: at)
        guard let piece = board[index.row][index.column] else { return nil }
        return piece
    }
    
    private func remove(from: Position) {
        let index = convertToIndex(position: from)
        board[index.row][index.column] = nil
    }
    
    private func countOf(color: PieceColor) -> Int {
        var count = 0
        for rank in board {
            for file in rank {
                guard let piece = file as? Color else { continue }
                guard piece.color == color else { continue }
                count += 1
            }
        }
        return count
    }

    func initPiece(type: Piece.Type, position: Position) {
        var piece = type.init()
        guard Self.LimitByPiece[ObjectIdentifier(type)] ?? 0 >= countOf(color: (piece as! Color).color) else { return }
        if locate(piece: piece, at: position) {
            piece.current = position
        }
    }

    func possibilties(from: Position) throws -> Array<Position>  {
        guard let piece = piece(at: from) as? Color & Piece else {
            throw GameError.pieceNotFound
        }
        guard piece.color == self.turn else {
            throw GameError.mismatchOfColor
        }
        return piece.possiblePositions()
    }
    
    func move(from: Position, to: Position) throws -> Bool {
        guard let selected = piece(at: from) as? Color & Piece else {
            throw GameError.pieceNotFound
        }
        let destination = piece(at: to) as? Color & Piece
        
        if destination == nil {
            remove(from: from)
        }
        else if destination?.color == selected.color {
            return false
        }
        let index = convertToIndex(position: to)
        board[index.row][index.column] = selected
        turn = (turn == .white) ? .black : .white
        return true
    }
    
    private func display() -> String {
        var result = [String]()
        result.append(" ABCDEFGH")
        for (index, rank) in board.enumerated() {
            var pieces = "\(index+1)"
            for file in rank {
                if let piece = file {
                    pieces += piece.code
                }
                else {
                    pieces += "."
                }
            }
            result.append(pieces)
        }
        return result.joined(separator: "\n")
    }
    
    func points() -> (black: Int, white: Int) {
        var blackPoints = 0
        var whitePoints = 0
        for rank in board {
            for file in rank {
                guard let piece = file as? Color & Piece else { continue }
                (piece.color == .white) ? (whitePoints += piece.point) : (blackPoints += piece.point)
            }
        }
        return (black: blackPoints, white: whitePoints)
    }
}
