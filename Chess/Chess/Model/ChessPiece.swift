//
//  ChessPiece.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/21.
//

protocol ChessPiece {
    var pieceColor: PieceColor { get }
    var pieceType: PieceType { get }
    var position: Position { get set }
    func isCanMove(to: Position) -> Bool
}

extension ChessPiece {
    var pieceText: String {
        return "\(position.column.rawValue)\(position.rank.rawValue)"
    }
}

struct EmptyPiece: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    init(
        pieceColor: PieceColor = .none,
        pieceType: PieceType = .none,
        position: Position) {
            self.pieceColor = pieceColor
            self.pieceType = pieceType
            self.position = position
        }
    
    func isCanMove(to: Position) -> Bool {
        return false
    }
}

struct Pawn: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        let toColumn = to.column
        
        if toColumn != position.column {
            return false
        }
        
        if abs(toRank.rawValue - position.rank.rawValue) > 1 {
            return false
        }
        
        if pieceColor == .white {
            if toRank.rawValue > position.rank.rawValue {
                return false
            }
        }
        
        if pieceColor == .black {
            if toRank.rawValue < position.rank.rawValue {
                return false
            }
        }
        
        return true
    }
}

struct Rook: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        
        if pieceColor == .white {
            if toRank.rawValue == position.rank.rawValue && to.column.number != position.column.number {
                return true
            }
            
            if toRank.rawValue < position.rank.rawValue && to.column.number == position.column.number {
                return true
            }
        }
        
        if pieceColor == .black {
            if toRank.rawValue == position.rank.rawValue && to.column.number != position.column.number {
                return true
            }
            
            if toRank.rawValue > position.rank.rawValue && to.column.number == position.column.number {
                return true
            }
        }
        
        return false
    }
}

struct Bishop: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        let toColumn = to.column
        
        if pieceColor == .white {
            if toRank.rawValue > position.rank.rawValue {
                return false
            }
        }
        
        if pieceColor == .black {
            if toRank.rawValue < position.rank.rawValue {
                return false
            }
        }
        
        return abs(position.rank.rawValue - toRank.rawValue) == abs(position.column.number - toColumn.number)
    }
}

struct Knight: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        let toColumn = to.column
        let rankDifference = abs(position.rank.rawValue - toRank.rawValue)
        let columnDifference = abs(position.column.number - toColumn.number)
        if (rankDifference == 2 && columnDifference == 1) || (rankDifference == 1 && columnDifference == 2) {
            return true
        }
        
        return false
    }
}

struct King: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        let toColumn = to.column
        
        if pieceColor == .white {
            if toRank.rawValue > position.rank.rawValue {
                return false
            }
        }
        
        if pieceColor == .black {
            if toRank.rawValue < position.rank.rawValue {
                return false
            }
        }
        
        let rankDifference = abs(position.rank.rawValue - toRank.rawValue)
        let columnDifference = abs(position.column.number - toColumn.number)
        
        return rankDifference <= 1 && columnDifference <= 1
    }
}

struct Queen: ChessPiece {
    let pieceColor: PieceColor
    let pieceType: PieceType
    var position: Position
    
    func isCanMove(to: Position) -> Bool {
        let toRank = to.rank
        let toColumn = to.column
        
        if pieceColor == .white {
            if toRank.rawValue > position.rank.rawValue {
                return false
            }
            
            if toRank.rawValue == position.rank.rawValue && to.column.number != position.column.number {
                return true
            }
            
            if toRank.rawValue < position.rank.rawValue && to.column.number == position.column.number {
                return true
            }
            
            return abs(position.rank.rawValue - toRank.rawValue) == abs(position.column.number - toColumn.number)
        }
        
        if pieceColor == .black {
            if toRank.rawValue < position.rank.rawValue {
                return false
            }
            
            if toRank.rawValue == position.rank.rawValue && to.column.number != position.column.number {
                return true
            }
            
            if toRank.rawValue > position.rank.rawValue && to.column.number == position.column.number {
                return true
            }
            
            return abs(position.rank.rawValue - toRank.rawValue) == abs(position.column.number - toColumn.number)
        }
        return false
    }
}

