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
 5. 이번주는 입력/출력을 담당하는 로직을 구현하지 않고, 핵심 로직을 위주로 구현하면서 단위 테스트로 기능을 확인한다
 6. 체스 프로그램을 시작하면 흑/백 Pawn을 초기화한다
 7. 체스 프로그램을 동작하는 동안, 턴을 반복하면서 입력을 받아서 말을 움직인다고 가정한다
 8. 움직이려는 말이 있는 위치와 이동하려는 위치를 차례대로 입력받아서 말을 이동한다.
 9. 말이 있는 위치 2자리 문자와 이동하려는 위치 2자리 문자를 입력받는다. 형식에 맞지 않으면 다시 입력받는다.
 예시) B2 ⇒ B3 : B2에 있던 Pawn을 B3로 이동한다.
 10. 흑 또는 백 체스말이 상대편 말이 있던 곳으로 이동해서 상대편 말을 잡는 경우는 체스판 점수를 출력한다.
 11. 체스말을 이동하는 명령은 백색부터 시작해서, 흑과 백이 번갈아서 처리해야 한다.

 프로그래밍 요구사항
 
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
 
 피드백
 가장 시간이 오래걸리거나 고민했던 요구사항이 있었나요?
 - 과제를 이해하고 Board 클래스를 선언하고 처음으로 변수나 메소드를 작성하는데 가장 오래 걸렸습니다.
 
 역할과 범위가 큰 Board부터 하위에 Pawn, Position 같은 타입까지 설계하고 구현할 때 어떤 순서로 작업하셨는지 궁금합니다. 큰 것부터 하시나요? 작은 것부터 하시나요?
 - Board
 
 Position에서 Column은 타입인데 Rank 타입은 왜 없나요?
 - 그러게 왜 없을까요...한 가지 문득 드는 생각은 Rank도 1~8이 있고 그 사이에 A~H까지 지정된 고정값인들인데, enum 타입으로 선언하면 int 값으로 잘못 입력하거나 하는 오류를 줄일 수 있지 않을까 하는 생각이 드네용...
 
 Pawn은 type과 position만 갖고 있고 나머지는 static 메소드만 있어서 상태를 가지고 동작하지 않네요
 혹시 Board에 있는 메소드 중에서 Pawn이 갖고 있어도 되는 메소드는 없을까요?
 - Board에 있는 메소드 중에서 Pawn이 갖고 있어도 되는 메소드...말 자체가 이해가 어렵네용...
 - static으로 선언한 것은 지금 다시 생각해보니 꼭 Pawn에 선언하지 않고 따로 파일을 만들어서 테스트용 객체에 선언해도 되지 않았을까 Board에서 꼭 Pawn안에 있는 static 객체를 가져올 필요는 없을 것 같다 객체의 역할이 애매모호 해지는 것 같은 느낌이 듭니다.
 - 왜 애매모호할까? Pawn은 체스판의 말을 의미하는 객체인데?
 
 테스트 함수를 많이 구현하셨네요. 모든 기능이 Board에 구현되어 있다보니 Board만 SUT로 잡아서 테스트하기 좋았던 것 같습니다
 - 테스트 하면서 불현듯 떠오른건데 한창 진행중인 요소나 누가 이기는지, 턴을 관리하는 메소드의 부제를 까먹었다는걸 알게 되서 부끄러웠습니다.
 
 moveToBlackPawn()와 moveToWhitePawn() 메소드를 구분하셨는 데, pawn 내부 값으로 구분하는 것과 어떤 차이가 있을까요?
 - 한 함수 내에 두 가지 다른 동작이 이루어지지 않도록 Pawn을 구분하고, Pawn을 움직이는 기능을 구현하는 의도로 제작된 임시 함수 입니다.
 - Pawn을 내부로 일일이 구분하는 것은 함수 하나에 지나치게 큰 의존성을 불러오지 않을까 그런 생각이 들었습니당.
 - 설계만 하다가 진행이 막혀서 일단 진행해보고 수정하자 식으로 만들었는데 그 뒤로 수정할 시간이 없어서 그대로 내게되었습니다.
 
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
    
   var currentTurn = PawnType.white
   var blackScore = 0
   var whiteScore = 0
    
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
        print("  ABCDEFGH", stringChessMap.joined(separator: "\n"), separator: "\n")
        
        return stringChessMap
    }
    
    /// Pawn 이동 요청
    func requestMovePawn(inputText: String) -> Bool {
        guard
            let (fromPosition, toPosition) = makeInputPositions(text: inputText)
        else {
            return false
        }
        
        return updateMovePawn(fromPosition: fromPosition, toPosition: toPosition)
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
            let fromRank = Int(fromRankString),
            let toRank = Int(toRankString)
        else {
            return nil
        }
        
        let fromPosition = Position(rank: fromRank, column: fromColumn)
        let toPosition = Position(rank: toRank, column: toColumn)
        
        return (from: fromPosition, to: toPosition)
    }
    
    /// 입력값이 유효하면 Pawn 이동 실행
    func updateMovePawn(fromPosition: Position, toPosition: Position) -> Bool {
        let fromPawn = checkPawnType(position: fromPosition)
        let toPawn = checkPawnType(position: toPosition)
        
        if isEmptyPawn(fromToPawn: fromPawn) || isCanMoveTurn(toPawn: toPawn) {
            return false
        }
        
        let canMove = canMovePawn(pawnType: fromPawn, fromPosition: fromPosition, toPosition: toPosition)
        
        if canMove {
            updateBoard(fromPosition: fromPosition, toPosition: toPosition, capturedPiece: toPawn)
        }
        
        return canMove
    }
    
    /// 이동실행이 이루어지면 Pawn 값 업데이트
    func updateBoard(fromPosition: Position, toPosition: Position, capturedPiece: PawnType) {
        let rankFrom = fromPosition.rank - 1
        let fromColumn = fromPosition.column.number
        let toColumn = toPosition.column.number
        
        let fromPawnType = checkPawnType(position: fromPosition) // fromPawnType 추가
        let rankTo = toPosition.rank - 1
        
        chessMap[rankTo][toColumn] = Pawn(pawnType: fromPawnType, position: toPosition)
        chessMap[rankFrom][fromColumn] = Pawn(pawnType: .none, position: fromPosition)
        
        if capturedPiece != .none {
            if fromPawnType == .white {
                blackScore += 1
            }
            
            if fromPawnType == .black {
                whiteScore += 1
            }
        }
        
        currentTurn = (currentTurn == .white) ? .black : .white
    }
    
    /// PawnType 구별
    func checkPawnType(position: Position) -> PawnType {
        if position.rank <= 0 || position.rank > 9 {
            return .none
        }
        let rank = chessMap[position.rank - 1][position.column.number]
        return rank.pawnType
    }
}

extension Board {
    
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
    
    // 움직일려는 Pawn이 none인지 검사
    func isEmptyPawn(fromToPawn: PawnType) -> Bool {
        return fromToPawn == .none || fromToPawn != currentTurn
    }
    
    // 현재 움직일 수 있는 차례인지
    func isCanMoveTurn(toPawn: PawnType) -> Bool {
        return toPawn != currentTurn
    }
}
