//
//  Board.swift
//  ChessApp
//
//  Created by Jiyeon  on 2023/10/16.
//

import Foundation

final class ChessBoard {

    struct Square {
        var position: Position
        var piece: Piece?
    }

    private var board: [Square] = []
    
    init() {
        board = initBoard()
        startGame()
    }
    
    func getScore() -> Int {
        var result: Int = 0
        let allPieceScore = board.compactMap({ $0.piece }).map({ type(of: $0).score })
        result = allPieceScore.reduce(0, +)
        return result
    }
    
    func display() -> String {
        var result: String = ""
        
        result.append(" ")
        Position.File.allCases.forEach {
            result.append("\($0.displayText)")
        }
        result.append("\n")
        
        let sortedBoard = board.sorted(by: { $0.position < $1.position })
        
        Position.Rank.allCases.forEach {
            let rank = $0
            let currentRank = sortedBoard.filter({ $0.position.rank == rank }).sorted(by: { $0.position.file.rawValue < $1.position.file.rawValue })
            result.append("\(rank.displayText)")
            currentRank.forEach {
                result.append("\($0.piece?.displayText ?? ".")")
            }
            result.append("\n")
        }
        
        result.append(" ")
        Position.File.allCases.forEach {
            result.append("\($0.displayText)")
        }
        
        return result
    }
    
    func canMove(by path: String) throws -> Bool {
        var canMove: Bool = false
        
        do {
            let positions = try validate(input: path)
            let from = positions[0]
            let to = positions[1]
            guard let fromSquareIndex = board.firstIndex(where: { $0.position == from }), let toSquareIndex = board.firstIndex(where: { $0.position == to }) else { return canMove }
            
            let fromSquare = board[fromSquareIndex]
            let toSquare = board[toSquareIndex]
            
            if let avaliableMovingPosition = fromSquare.piece?.getMovablePositions(from: fromSquare.position), avaliableMovingPosition.contains(where: { $0 == to }) {

                if toSquare.piece == nil {
                    canMove = true
                } else {
                    if fromSquare.piece?.color != toSquare.piece?.color {
                        canMove = true
                    }
                }
            }
            
            if canMove {
                let movingPiece = board[fromSquareIndex].piece
                board[toSquareIndex].piece = movingPiece
                board[fromSquareIndex].piece = nil
            }
            
            return canMove
        } catch {
            throw error
        }
    }
    
    private func initBoard() -> [Square] {
        var board: [Square] = .init()
        
        Position.Rank.allCases.forEach { rank in
            Position.File.allCases.forEach { file in
                board.append(.init(position: .init(rank: rank, file: file)))
            }
        }
        
        return board
    }
    
    private func startGame() {
        var whitePawns: [Pawn] = .init(repeating: .init(color: .white), count: Pawn.maxCount)
        var whiteBishops: [Bishop] = .init(repeating: .init(color: .white), count: Bishop.maxCount)
        var whiteRooks: [Rook] = .init(repeating: .init(color: .white), count: Rook.maxCount)
        var whiteQueens: [Queen] = .init(repeating: .init(color: .white), count: Queen.maxCount)
        var whiteKnights: [Knight] = .init(repeating: .init(color: .white), count: Knight.maxCount)
        
        var blackPawns: [Pawn] = .init(repeating: .init(color: .black), count: Pawn.maxCount)
        var blackBishops: [Bishop] = .init(repeating: .init(color: .black), count: Bishop.maxCount)
        var blackRooks: [Rook] = .init(repeating: .init(color: .black), count: Rook.maxCount)
        var blackQueens: [Queen] = .init(repeating: .init(color: .black), count: Queen.maxCount)
        var blackKnights: [Knight] = .init(repeating: .init(color: .black), count: Knight.maxCount)

        for (index, square) in board.enumerated() {
            if square.piece == nil, let availableInitPieceColor = square.position.getInitAvailableColor() {
                switch availableInitPieceColor {
                case .white:
                    if let whitePawn = whitePawns.first, whitePawn.isPossibleInitPosition(with: square.position) {
                        board[index].piece = whitePawn
                        whitePawns.removeFirst()
                    } else if let whiteBishop = whiteBishops.first, whiteBishop.isPossibleInitPosition(with: square.position) {
                        board[index].piece = whiteBishop
                        whiteBishops.removeFirst()
                    } else if let whiteRook = whiteRooks.first, whiteRook.isPossibleInitPosition(with: square.position) {
                        board[index].piece = whiteRook
                        whiteRooks.removeFirst()
                    } else if let whiteQueen = whiteQueens.first, whiteQueen.isPossibleInitPosition(with: square.position) {
                        board[index].piece = whiteQueen
                        whiteQueens.removeFirst()
                    } else if let whiteKnight = whiteKnights.first, whiteKnight.isPossibleInitPosition(with: square.position) {
                        board[index].piece = whiteKnight
                        whiteKnights.removeFirst()
                    }
                case .black:
                    if let blackPawn = blackPawns.first, blackPawn.isPossibleInitPosition(with: square.position) {
                        board[index].piece = blackPawn
                        blackPawns.removeFirst()
                    } else if let blackBishop = blackBishops.first, blackBishop.isPossibleInitPosition(with: square.position) {
                        board[index].piece = blackBishop
                        blackBishops.removeFirst()
                    } else if let blackRook = blackRooks.first, blackRook.isPossibleInitPosition(with: square.position) {
                        board[index].piece = blackRook
                        blackRooks.removeFirst()
                    } else if let blackQueen = blackQueens.first, blackQueen.isPossibleInitPosition(with: square.position) {
                        board[index].piece = blackQueen
                        blackQueens.removeFirst()
                    } else if let blackKnight = blackKnights.first, blackKnight.isPossibleInitPosition(with: square.position) {
                        board[index].piece = blackKnight
                        blackKnights.removeFirst()
                    }
                }
            }
        }
    }
    
    private func validate(input: String) throws -> [Position] {
        let inputs = input.components(separatedBy: "->")
        guard inputs.count == 2 else { throw ErrorType.wrongInput }
        
        do {
            let from = try makePosition(by: inputs[0])
            let to = try makePosition(by: inputs[1])
            return [from, to]
        } catch {
            throw error
        }
    }
    
    private func makePosition(by input: String) throws -> Position {
        let separated = input.map({ String($0) })
        guard let file = Position.File.allCases.first(where: { $0.displayText == separated[0] }),
              let rank = Position.Rank.allCases.first(where: { $0.displayText == separated[1]}) else {
            throw ErrorType.wrongInput
        }
        return .init(rank: rank, file: file)
    }
}
