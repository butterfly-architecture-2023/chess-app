//
//  ChessMap.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/29.
//

import Foundation

final class ChessMap {
    private var boardState: [[ChessPiece]]
    
    var isEmpty: Bool {
        return boardState.filter {
            ($0.filter { item in
                item.pieceType != .none
            }).isEmpty
        }.isEmpty
    }
    
    init(boardState: [[ChessPiece]] = Define.chessMap) {
        self.boardState = boardState
    }
    
    func getPiece(at position: Position) -> ChessPiece {
        return boardState[position.rank.index][position.column.number]
    }
    
    func setPiece(_ piece: ChessPiece) {
        let rank = piece.position.rank
        let column = piece.position.column
        boardState[rank.index][column.number] = piece
    }
    
    func makeChessMapString() -> [String] {
        let stringChessMap = boardState.enumerated().map { index, item in
            item.reduce("\(index+1)-") { partialResult, piece in
                "\(partialResult+piece.pieceType.pieceCode(colorType: piece.pieceColor))"
            }
        }
        return stringChessMap
    }
    
    // 선택한 Piece가 움직일 수 있는 영역들 얻기
    func getCanMovePieceList(piece: ChessPiece) -> [ChessPiece] {
        let list = boardState.reduce([]) { partialResult, pieces in
            return partialResult+pieces
        }
        
        let canMoveList = list.filter { piece.isCanMove(to: $0.position) }
            .filter {
                !checkPiecePath(from: piece, to: $0)
            }
        return canMoveList
    }
    
    /// 이동반경에 같은색 Piece가 존재하는지 검사
    func checkPiecePath(from: ChessPiece, to: ChessPiece) -> Bool {
        if from.position == to.position {
            return true
        }
        
        if from.pieceType == .bishop  {
            return checkBishopPath(from: from, to: to)
        }
        
        if from.pieceType == .rook {
            return checkRookPath(from: from, to: to)
        }
        
        if from.pieceType == .queen {
            let bishop = checkBishopPath(from: from, to: to)
            let rook = checkRookPath(from: from, to: to)
            return !(bishop == rook && bishop == false)
        }
        
        return false
    }
    
    /// Rook 이동 반경에 Piece 존재 검사
    func checkRookPath(from: ChessPiece, to: ChessPiece) -> Bool {
        if from.position.rank == to.position.rank {
            return checkColumnPath(from: from, to: to)
        }
        
        if from.position.column == to.position.column {
            return checkRankPath(from: from, to: to)
        }
        return false
    }
    
    /// Rook 이동 반경 중 Colum 경로에 Piece  존재 검사
    func checkColumnPath(from: ChessPiece, to: ChessPiece) -> Bool {
        let minColumn = min(from.position.column.number, to.position.column.number)
        let maxColumn = max(from.position.column.number, to.position.column.number)
        guard minColumn < maxColumn else { return true }
        
        for columnToCheck in (minColumn+1)..<maxColumn {
            let positionToCheck = Position(rank: from.position.rank, column: Column.allCases[columnToCheck])
            if getPiece(at: positionToCheck).pieceColor != .none {
                return true
            }
        }
        return false
    }
    
    /// Rook 이동 반경 중 Rank 경로에 Piece  존재 검사
    func checkRankPath(from: ChessPiece, to: ChessPiece) -> Bool {
        let minRank = min(from.position.rank.index, to.position.rank.index)
        let maxRank = max(from.position.rank.index, to.position.rank.index)
        
        for rankToCheck in (minRank+1)..<maxRank {
            let positionToCheck = Position(rank: Rank.allCases[rankToCheck], column: from.position.column)
            if getPiece(at: positionToCheck).pieceColor != .none {
                return true
            }
        }
        return false
    }
    
    /// Bishop 이동 반경 중 Piece  존재 검사
    func checkBishopPath(from: ChessPiece, to: ChessPiece) -> Bool {
        let rankDiff = abs(to.position.rank.index - from.position.rank.index)
        let colDiff = abs(to.position.column.number - from.position.column.number)
        
        if rankDiff != colDiff {
            return false
        }
        
        let rankDirection = to.position.rank.index > from.position.rank.index ? 1 : -1
        let colDirection = to.position.column.number > from.position.column.number ? 1 : -1
        
        var currentRank = from.position.rank.index + rankDirection
        var currentCol = from.position.column.number + colDirection
        
        while currentRank != to.position.rank.index {
            if currentRank < 0 || currentCol < 0 {
                return true
            }
            
            let currentPosition = Position(rank: Rank.allCases[currentRank],
                                           column: Column.allCases[currentCol])
            
            if getPiece(at: currentPosition).pieceColor != .none {
                return true
            }
            
            currentRank += rankDirection
            currentCol += colDirection
        }
        return false
    }
    
    func removePiece(position: Position) {
        boardState[position.rank.index][position.column.number] = EmptyPiece(position: position)
    }
}
