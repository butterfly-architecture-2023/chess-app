//
//  Board.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

import Foundation

final class Board {
    var chessMap = ChessMap()
    
    var isEmpty: Bool {
        return chessMap.isEmpty
    }
    
    var currentTurn = PieceColor.white
    
    var completion: ((Int, PieceColor) -> ())?
    
    var canMoveList = [ChessPiece]()
    
    var blackScore = 0
    
    var whiteScore = 0
    
    @discardableResult
    func display() -> [String] {
        let stringChessMap = chessMap.makeChessMapString()
        
        /// 참고용 출력함수
        // print("  ABCDEFGH", stringChessMap.joined(separator: "\n"), separator: "\n")
        return stringChessMap
    }
    
    /*
     이동은 Board에서 제공하기 떄문에 board.move(...) 로 요청
     move 안에 Request Move, Can Move, Move apply, Move Result 함수를 호출
     */
    
    @discardableResult
    func movePiece(inputText: String) -> Bool {
        guard
            let (fromPiece, toPiece) = makeInputPiece(inputText: inputText),
            isCanMoveTurn(fromPiece: fromPiece),
            canMovePiece(fromPiece: fromPiece, toPiece: toPiece),
            getCanMovePieceList(fromPiece: fromPiece).isEmpty == false,
            applyMovePiece(fromPiece: fromPiece, toPiece: toPiece)
                //canMoveList.contains(where:  { $0.position == toPiece.position })
        else {
            return false
        }
        
        updateBoard(fromPiece: fromPiece, toPiece: toPiece)
        return true
    }
    
    /// 입력값이 유효하면 Pawn 이동 실행
    func applyMovePiece(fromPiece: ChessPiece, toPiece: ChessPiece) -> Bool {
        var newPiece = fromPiece
        newPiece.position = toPiece.position
        let emptyPiece = EmptyPiece(position: fromPiece.position)
        
        let fromRank = fromPiece.position.rank.index
        let fromColumn = fromPiece.position.column.number
        let toRank = toPiece.position.rank.index
        let toColumn = toPiece.position.column.number
        
        guard
            fromRank > -1 && fromRank < 8,
            fromColumn > -1 && fromColumn < 8,
            toRank > -1 && toRank < 8,
            toColumn > -1 && toColumn < 8
        else {
            return false
        }
        
        chessMap.setPiece(emptyPiece)
        chessMap.setPiece(newPiece)
        return true
    }
    
    /// 이동실행이 이루어지면 Piece 값 업데이트
    func updateBoard(fromPiece: ChessPiece, toPiece: ChessPiece) {
        if currentTurn == .black {
            blackScore += toPiece.pieceType.score
            currentTurn = .white
            completion?(toPiece.pieceType.score, .black)
            return
        }
        
        if currentTurn == .white {
            whiteScore += toPiece.pieceType.score
            currentTurn = .black
            completion?(toPiece.pieceType.score, .black)
            return
        }
    }
    
    func makeInputPiece(inputText: String) -> (ChessPiece, ChessPiece)? {
        guard
            let (fromPosition, toPosition) = InputTextManager.makeInputPosition(text: inputText)
        else {
            return nil
        }
        let fromPiece = getPiece(position: fromPosition)
        let toPiece = getPiece(position: toPosition)
        
        return (fromPiece, toPiece)
    }
    
    func resetList() {
        canMoveList.removeAll()
    }
}

extension Board {
    func getCanMovePieceList(fromPiece: ChessPiece) -> [ChessPiece] {
        guard canMoveList.isEmpty else {
            return canMoveList
        }
        
        let list = chessMap.getCanMovePieceList(piece: fromPiece)
            .filter {
                canMovePiece(fromPiece: fromPiece, toPiece: $0)
            }
        
        canMoveList = list
        return list
    }
    
    // 이동 요청이 유효한지 확인
    func canMovePiece(fromPiece: ChessPiece, toPiece: ChessPiece) -> Bool {        
        guard
            fromPiece.pieceType != .none,
            fromPiece.pieceColor != toPiece.pieceColor,
            fromPiece.position != toPiece.position
        else {
            return false
        }
        
        return fromPiece.isCanMove(to: toPiece.position)
    }
    
    // 현재 움직일 수 있는 차례인지
    func isCanMoveTurn(fromPiece: ChessPiece) -> Bool {
        return fromPiece.pieceColor == currentTurn
    }
    
    // 체스말 접근
    func getPiece(position: Position) -> ChessPiece {
        return chessMap.getPiece(at: position)
    }
}
