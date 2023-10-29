# chess-app
체스게임 앱을 만들면서 개선해봅니다

## 개발 과정

### 요구사항 분석

* 초기화의 경우 King 을 제외한 모든 말을 초기화한다.
* 턴은 백색부터 시작
* Board 는 체스말의 이동에 대한 입력/검증/처리(계산)/형식/출력 을 담당한다.
  * 사용자는 이동을 위해 커맨드를 입력한다.
  * Board 는 커맨드를 검증한 뒤 이동을 수행한다.
    - 이동하지 못할 경우 상태 혹은 결과를 반환한다.
    - 점수 계산을 수행하여 출력한다.
  * 결과를 콘솔에 출력한다.
* (현재는 Unit-Test 로만 결과를 검증한다)

### 설계

0. (struct) BoardView : 모델인 Board 의 inputCmd 를 호출. BoardResult 에 따라 뷰 업데이트.
1. (class) Board : 체스판 전체. 입력을 Position 으로 변경하고 체스말을 이동시킨다. 체스 게임 자체를 정의함.
  1. (struct) BoardPieceManager : Board 에서 사용할 positons 를 생성함. Board 를 테스트하기 위한 positions 로 반환하기도 함.
  2. (enum) BoardPieceManager 를 초기화하는
  3. (struct) BoardMoveManager : 이동 가능한 범위를 반환 
  4. (enum) BoardResult : 체스판에서 방출할 수 있는 결과 값.
    1. 이동 완료.
    2. 이동 완료. 흰색 혹은 검은색이 점수를 얻음.
    3. 이동할 수 없는 입력.
2. (class) Pawn, Bishop, Knight, Queen, King : 각 체스말
3. (enum) BoardMoveResult : 체스말 움직임 이후 변경 결과
4. (enum) Row / Column : 열(1~8)과 행(A~H)
5. (enum) Color : 체스말 색
6. (enum) MoveVector : 체스말이 이동할 수 있는 방향과 거리
7. (protocol) Piece: 체스말이 구현해야할 프로토콜

### 개발

설계 단계에서 고민한 각각의 객체에 대해 다음의 역할을 부여한다.

개발 순서는 작은 단위부터 큰 구현으로 넘어가도록 한다.

1. Board
    - 초기화 시 BoardPieceManager 를 이용해서 positions 를 전달받음.
    1. `inputCmd(\_:String)` 를 생성한다. 
        - 입력을 Board 에서 필요한 Position 으로 변경.
        - 체스말이 있는 입력이라면 BoardMoveManager 를 이용해서 이동 가능한 범위를 반환 받음.
        - 현재 턴에 해당하지 않는 체스말이라면 아무 행동도 하지 않고 return 한다.
    2. `move(_:(start: Position, dest: Position)`
        - 출발 체스말은 비우고 도착점의 체스말은 출발 체스말로 대체한다.
        - Side Effect 가 발생(체스말의 삭제)하면 calculate 를 호출한다.
    3. `calculate(_:any Piece)`
        - Side Effect 인 Piece 에 따라 점수판을 변경한다.
    4. `BoardPieceManager`
        - 8개의 폰과 룩, 나이트, 비숍, 킹, 퀸, 비숍, 나이트, 룩 조합으로 구성.
        - 기본 구성은 1번 줄에 검은색 체스말 조합, 2번 줄에 검은색 폰 8개, 7번 줄에 흰색 폰 8개,   8번 줄에 흰색 체스말 조합을 둔다. 
        - 특정 테스트 케이스를 위해 위의 기본 구성과 다른 구성을 반환할 수 있다.
    5. `BoardMoveManager`
        - `getMoveVectors(board:[Position],piece:any   Piece,from:Position)->[MoveVector]` 는 board 의 상태를 보고 이동할 수 있는   모든 MoveVector 를 배열로 반환한다.
        - `hasObstacle(vector:MoveVector,from:Position)` 은 이동하려는 방향에 장애물이 없는지 확인한다. 체스판의 맨 끝도 장애물로 판단한다.
        - *getMoveVector* 가 Pice 의 directionMovable 마다 다음의 for-loop 를 실행한다.
        - 각 directionMovable 인 MoveVector 에 대해 distance 가 끝날때까지, *hasObstacle* 이 true 를 반환할 때까지 sub-for-loop 를 실행한다.
2. Pawn, Bishop, Knight, Queen, King
    - 자신의 종류, 색, 이동가능한 방향을 저장
    - Piece 프로토콜 구현
3. Row, Column
    - Row case 는 1~8, Column case 는 A~H
    - 연산자를 이용해 계산할 수 있도록 함
5. PieceColor
    - case 로 white, black
6. MoveVector
    - case 로 up, upRight, right, downRight, down, downLeft, left, upLeft, combination 를 가짐
    - Knight 는 직진, 대각선을 동시에 진행하기 때문에 combination 을 추가. combination 은 MoveDirection 배열을 관련 값으로 가진다
    - `add(_:Int)` 함수를 통해 방향과 거리를 추가함. 
      - (예: 나이트의 경우 아래2, 대각선1 이므로 combination 타입이어야 함)
    - 이외에도 MoveVector 끼리 연산하기에 편한 여러 메소드를 제공
7. BoardMoveResult
    - case 로 `moved((any Piece)?)`, `invalidMove` 를 가짐
    - moved 는 실제 Board 를 업데이트 하고, Side effect 에 대한 추가 작업을 지시
    - invalidMove 는 유저가 이동하려고 한 입력값이 잘못되었음을 표현
8. Piece
    - Color, MoveVector 를 가짐
   
### 검증

아래의 검증 방법은 개발을 진행하며 어떻게 바뀌는지 계속 추가할 예정.

<~~개발한 기능에 대해 상태, 출력, 통신 기반 테스트를 이용하여 검증한다.~~>

<~~현재 테스트가 실패하고 있음. 아래의 방향으로 작업을 추가해야 함.~~>
<~~- 구현부분 변경~~>
<~~- 테스트 코드를 새로 작성~~>
<~~- 리팩토링 후 테스트 코드 수정~~>

<~~1. Board~~>
  - <~~연속적인 이동을 하고 다음의 내용을 상태 기반 테스트한다. 점수, 말의 갯수, 이동 가능 여부, 누구의 턴~~>
  - <~~최대한 Assert 문은 XCTAssertEqual 로 일원화해본다. Board 는 대부분 BoardResult 를 방출할 것이므로~~>
  - <~~이동이 가능할 것으로 예상되는 MoveDirection 이 어떤 Pawn 을 이동하는지 여부를 통신 기반 테스트로 검증한다~~>
<~~2. Pawn, Bishop, Knight, Queen~~>
  - <~~이동방향 입력에 대해 정확한 결과를 반환하는지 출력 기반 테스트로 검증한다~~>
<~~3. Row, Column *(Done)*~~>
  - <~~Board 의 `getPosition(from:String)` 을 통해 경계조건을 테스트~~>
<~~4. PieceType *(Done)*~~>
  - <~~자체적으로 만든 Mock 객체가 Pawn 과 똑같이 동작하는지 출력 기반 테스트로 검증한다~~>
<~~5. MoveDirection~~>
  - <~~combination 으로 move 로 상태기반 테스트로 검증한다~~>
