//
//  Board.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

import Foundation

/*
 기능요구사항
 1. iOS 프로젝트지만 시뮬레이터를 실행하지 않고 다음과 같은 기능을 구현하고 검증하는 과정에 집중한다.
 2. 프로그램을 설계할 때 입력 → 검증 → 처리/계산 → 형식 → 출력 단계를 구분한다
 3. 계층적으로 구분할 지, 타입으로 구분할 지, 데이터 흐름으로 구분할 지 스스로 판단한다
 4. 코드 뿐만 아니라 의도를 표현할 수 있는 글, 그림, 도형, 자료를 작성한다
 5. 이번주 동안은 입력/출력을 담당하는 로직을 제외하고 핵심 로직을 위주로 구현한다
 6. 프로그램을 시작하면 King을 제외한 흑/백 체스말을 초기화한다
 7. 프로그램을 동작하는 동안, 턴을 반복하면서 입력을 받아서 말을 움직인다
 8. 움직이려는 말이 있는 위치와 이동하려는 위치를 차례대로 입력받아서 말을 이동한다.
 9. 말이 있는 위치 2자리 문자와 이동하려는 위치 2자리 문자를 입력받는다. 형식에 맞지 않으면 다시 입력받는다.
 예시) B2 ⇒ B3 : B2에 있던 Pawn을 B3로 이동한다.
 10. 흑 또는 백 체스말이 상대편 말이 있던 곳으로 이동해서 상대편 말을 잡는 경우는 체스판 점수를 출력한다.
 11. 도움말 기능은 특정 위치에 있는 말이 움직일 수 있는 경우를 모두 출력한다.
 12. 단, 자신과 같은 색의 말이 가리고 있는 경우는 멈춘다.
 예시) A1에 흑색 Rook가 있고, C1에 흑색 Bishop이 있는 경우 : "A2,A3,A4,A5,A6,A7,A8,B1"
 예시) F1에 흑색 Bishop이 있고, E2와 G2에 Pawn이 있는 경우 : "없음"
 13. 체스말을 이동하는 명령은 백색부터 시작해서, 흑과 백이 번갈아서 처리해야 한다.
 
 체스판 요구사항
 1. Board는 이전과 동일하게 체스판에 체스말(Piece) 존재 여부를 관리한다.
 2. Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력한다.
 3. 색상별로 Pawn 1점, Bishop와 Knight 3점, Rook 5점, 퀸은 9점으로 계산한다.
 4. Board는 모든 말의 위치를 알 수 있고, display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴한다
 5. 흑색 Pawn는 ♟ U+265F, Knight는 ♞ U+265E, Biship은 ♝ U+265D, Rook는 ♜ U+265C, Queen은 ♛ U+265B를 빈 곳은 "."을 표시한다.
 6. 백색 Pawn는 ♙ U+2659, Knight는 ♘ U+2658, Biship은 ♗ U+2657, Rook는 ♖ U+2656, Queen은 ♕ U+2655를 빈 곳은 "."을 표시한다.
 7. 예를 들어 초기화 상태에 Rook, Bishop, Queen만 있는 경우 1-rank는 "♜♞♝.♛♝♞♜" 가 된다.
 8. 특정 위치에 특정 말을 생성한다.
 9. 초기화 할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
 10. 체스말 초기 위치가 아니면 생성하지 않는다.
 11. 이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
 12. 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
 13. Pawn는 색상별로 8개. Bishop, Rook는 색상별로 2개, Queen는 색상별로 1개만 가능하다.
 14. 특정 말을 옮기는 메소드는 Board에서 제공한다.
 15. 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
 16. 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
 17. 만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
 18. 체스말은 위치값은 가로 file은 A부터 H까지, 세로 rank는 1부터 8까지 입력이 가능하다.
 19 .체스말은 색상값을 흑Black 또는 백White 중에 하나를 가진다.
 20. 체스말 색상은 변경할 수 없다.
 21. 체스말은 현재 위치를 기준으로 이동할 수 있는 모든 위치를 제공한다.
 22. 다른 말이 있는지 여부는 판단하지 않는다.
 
 Queen 요구사항
 1. 생성 위치는 흑색은 E-1에만 가능하고, 백색은 E-8 에만 가능하다.
 2. 모든 색상이 놓여진 칸을 기준으로 대각선이 좌-우, 위-아래 방향으로 움직일 수 있다.
 
 Knight 요구사항
 1. 생성 위치는 흑색은 B-1 과 G-1 에만 가능하고, 백색은 B-8 과 G-8 에만 가능하다.
 2. 모든 색상이 놓여진 칸을 기준으로 전진1칸+대각선1칸으로만 움직일 수 있다.
 3. 체스 게임과 달리 전진하는 칸이 막혀있으면 움직일 수 없다.
 
 Pawn 요구사항
 1. 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
 2. 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
 3. 체스 게임과 달리 처음에도 1칸만 움직일 수 있고, 다른 말을 잡을 때도 대각선이 아니라 직선으로 움직일 때 잡는다고 가정한다.
 
 Rook 요구사항
 1. 생성 위치는 흑색은 A-1 과 H-1 에만 가능하고, 백색은 A-8 과 H-8 에만 가능하다.
 2. 모든 색상이 놓여진 칸을 기준으로 좌-우 또는 위-아래 방향으로 움직일 수 있다.
 
 Bishop 요구사항
 1. 생성 위치는 흑색은 C-1 과 F-1 에만 가능하고, 백색은 C-8 과 F-8 에만 가능하다.
 2. 모든 색상이 놓여진 칸을 기준으로 대각선으로만 움직일 수 있다.
 백색은 더 작은 rank로 움직일 수 있고, 흑색은 더 큰 rank로 움직일 수 있다.
 
 체스 게임과 달리 처음에도 1칸만 움직일 수 있고, 다른 말을 잡을 때도 대각선이 아니라 직선으로 움직일 때 잡는다고 가정한다.
 */


final class Board {
    var chessMap = Define.emptyPieceList
    
    var isEmpty: Bool {
        return chessMap.filter {
            ($0.filter { item in
                item.pieceType != .none
            }).isEmpty
        }.isEmpty
    }
    
    var currentTurn = PieceColor.white
    var blackScore = 0
    var whiteScore = 0
    
    /// Board(체스판) 초기화
    init() {
        chessMap[0] = Define.firstBlackLineList
        chessMap[1] = Define.firstBlackPawnList
        chessMap[6] = Define.firstWhitePawnList
        chessMap[7] = Define.firstWhiteLineList
    }
    
    @discardableResult
    func display() -> [String] {
        let stringChessMap = chessMap.enumerated().map { index, item in
            item.reduce("\(index+1)-") { partialResult, piece in
                "\(partialResult+piece.pieceType.pieceCode(colorType: piece.pieceColor))"
            }
        }
        
        /// 참고용 출력함수
        print("  ABCDEFGH", stringChessMap.joined(separator: "\n"), separator: "\n")
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
            applyMovePiece(fromPiece: fromPiece, toPiece: toPiece)
                
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
        
        let fromRank = fromPiece.position.rank.rawValue-1
        let fromColumn = fromPiece.position.column.number
        let toRank = toPiece.position.rank.rawValue-1
        let toColumn = toPiece.position.column.number
        
        guard
            fromRank > -1 && fromRank < 8,
            fromColumn > -1 && fromColumn < 8,
            toRank > -1 && toRank < 8,
            toColumn > -1 && toColumn < 8
        else {
            return false
        }
        
        chessMap[fromRank][fromColumn] = EmptyPiece(position: fromPiece.position)
        chessMap[toRank][toColumn] = newPiece
        return true
    }
    
    /// 이동실행이 이루어지면 Piece 값 업데이트
    func updateBoard(fromPiece: ChessPiece, toPiece: ChessPiece) {
        if currentTurn == .black {
            blackScore += toPiece.pieceType.score
            currentTurn = .white
            return
        }
        
        if currentTurn == .white {
            whiteScore += toPiece.pieceType.score
            currentTurn = .black
            return
        }
    }
    
    func makeInputPiece(inputText: String) -> (ChessPiece, ChessPiece)? {
        guard
            let (fromPosition, toPosition) = makeInputPositions(text: inputText)
        else {
            return nil
        }
        
        let fromPiece = getPiece(position: fromPosition)
        let toPiece = getPiece(position: toPosition)
        
        return (fromPiece, toPiece)
    }
    
    /// 입력 Text 값 해석, Position 리턴, 실패시 nil 리턴
    func makeInputPositions(text: String) -> (from: Position, to: Position)? {
        let textSplits = text.split(separator: "->")
        
        guard
            textSplits.count == 2
        else {
            return nil
        }
        
        let fromColumnString = String(textSplits[0].prefix(1))
        let toColumnString = String(textSplits[1].prefix(1))
        let fromRankString = String(textSplits[0].suffix(1))
        let toRankString = String(textSplits[1].suffix(1))
        
        guard
            let fromColumn = Column(rawValue: fromColumnString),
            let toColumn = Column(rawValue: toColumnString),
            let fromRank = Rank(rawValue: Int(fromRankString) ?? 0),
            let toRank = Rank(rawValue: Int(toRankString) ?? 0)
        else {
            return nil
        }
        
        let fromPosition = Position(rank: fromRank, column: fromColumn)
        let toPosition = Position(rank: toRank, column: toColumn)
        
        return (from: fromPosition, to: toPosition)
    }
}

extension Board {
    // 이동 요청이 유효한지 확인
    func canMovePiece(fromPiece: ChessPiece, toPiece: ChessPiece) -> Bool {
        guard
            fromPiece.pieceType != .none,
            fromPiece.pieceColor != toPiece.pieceColor
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
        return chessMap[position.rank.rawValue - 1][position.column.number]
    }
}
