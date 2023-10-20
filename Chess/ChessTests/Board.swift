//
//  Board.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

import Foundation

/*
 1. Board는 8x8 크기 체스판에 체스말(Piece) 존재 여부를 관리한다
 2. 가로 = rank (row에 해당)
 3. 세로 = file (column에 해당)
 4. Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력한다.
 5. 색상별로 Pawn 하나당 1점씩 계산한다
 6. Board는 모든 말의 위치를 알 수 있고, display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴한다
 7. 흑색 Pawn는 ♟ U+265F를 빈 곳은 "."을 표시한다.
 8. 백색 Pawn는 ♙ U+2659를 빈 곳은 "."을 표시한다.
 9. 게임 시작시점에는 특정 위치에 특정 말을 생성한다.
 10. 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
 11. 체스말 초기 위치가 아니면 생성하지 않는다.
 12. 이미 해당 위치에 다른 말이 있으면 생성하지 않는다.
 13. 체스말 종류별로 최대 개수보다 많이 생성할 수는 없다.
 14. Pawn는 색상별로 8개만 가능하다.
 15. 특정 말을 옮기는 메소드는 Board에서 제공한다.
 16. 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
 17. 말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
 18. 만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
 19. 체스말은 위치값은 가로 file은 A부터 H까지, 세로 rank는 1부터 8까지 입력이 가능하다.
 20. 체스말은 색상값을 흑Black 또는 백White 중에 하나를 가진다.
 21. 체스말 색상은 변경할 수 없다.
 22. 체스말은 현재 위치를 기준으로 이동할 수 있는 모든 위치를 제공한다.
 23. 다른 말이 있는지 여부는 판단하지 않는다.
 
 Pawn 요구사항
 1. 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
 2. 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
 3. 체스 게임과 달리 처음에도 1칸만 움직일 수 있고, 다른 말을 잡을 때도 대각선이 아니라 직선으로 움직일 때 잡는다고 가정한다.
 */

final class Board {
    private var chessMap = Pawn.emptyPawnList
    
    var isEmpty: Bool {
        return chessMap.filter {
            ($0.filter { item in
                item.pawnType != .none
            }).isEmpty
        }.isEmpty
    }
    
    /// Board(체스판) 초기화
    init() {
        chessMap[1] = Pawn.firstBlackPawnList
        chessMap[6] = Pawn.firstWhitePawnList
    }
    
    @discardableResult
    func display() -> [String] {
        let stringChessMap = chessMap.enumerated().map { index, item in
            item.reduce("\(index+1)-") { partialResult, pawn in
                partialResult+pawn.pawnType.rawValue
            }
        }
        
        /// 참고용 출력함수
        // print("  ABCDEFGH", stringChessMap.joined(separator: "\n"), separator: "\n")
        
        return stringChessMap
    }
    
    /// Pawn == .empty 인 경우 false 리턴
    func movePawn(fromPosition: Position, toPosition: Position) -> Bool {
        let pawnType = checkPawnType(position: fromPosition)
        if pawnType == .black {
            return moveToBlackPawn(fromPosition: fromPosition, toPosition: toPosition)
        }
        
        if pawnType == .white {
            return moveToWhitePawn(fromPosition: fromPosition, toPosition: toPosition)
        }
        
        return false
    }
    
    /// PawnType 구별
    func checkPawnType(position: Position) -> PawnType {
        if position.rank <= 0 || position.rank > 9 {
            return .none
        }
        let rank = chessMap[position.rank - 1][position.column.number]
        return rank.pawnType
    }
    
    /// PawnType == .black인 말 위치 이동
    func moveToBlackPawn(fromPosition: Position, toPosition: Position) -> Bool {
        guard
            canMovePawn(pawnType: .black, fromPosition: fromPosition, toPosition: toPosition)
        else {
            return false
        }
        
        let rank = fromPosition.rank - 1
        guard
            let fromIndex = chessMap[rank].firstIndex(where: { $0.position == fromPosition })
        else {
            return false
        }
        
        let newRank = rank + 1
        let toColumnIndex = toPosition.column.number
        chessMap[rank][fromIndex] = Pawn(pawnType: .none, position: fromPosition)
        chessMap[newRank][toColumnIndex] = Pawn(pawnType: .black, position: toPosition)
        
        return true
    }
    
    /// PawnType == .white인 말 위치 이동
    func moveToWhitePawn(fromPosition: Position, toPosition: Position) -> Bool {
        guard
            canMovePawn(pawnType: .white, fromPosition: fromPosition, toPosition: toPosition)
        else {
            return false
        }
        
        let rank = fromPosition.rank - 1
        guard
            let fromIndex = chessMap[rank].firstIndex(where: { $0.position == fromPosition })
        else {
            return false
        }
        
        let newRank = rank - 1
        let toColumnIndex = toPosition.column.number
        chessMap[rank][fromIndex] = Pawn(pawnType: .none, position: fromPosition)
        chessMap[newRank][toColumnIndex] = Pawn(pawnType: .white, position: toPosition)
        
        return true
    }
    
    /// Pawn 이동 가능 여부 판별 허용 Rank 미만 혹은 초과, Column이 다를 경우 false 리턴
    func canMovePawn(pawnType: PawnType, fromPosition: Position, toPosition: Position) -> Bool {
        if pawnType == .black {
            let rank = fromPosition.rank
            if rank + 1 <= 8 && toPosition.rank - 1 == rank {
                return rank < toPosition.rank && fromPosition.column == toPosition.column
            }
        }
        
        if pawnType == .white {
            let rank = fromPosition.rank
            if rank - 1 >= 0 && rank - 1 == toPosition.rank {
                return rank > toPosition.rank && fromPosition.column == toPosition.column
            }
        }
        return false
    }
}
