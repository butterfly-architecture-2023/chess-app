# chess-app
체스게임 앱을 만들면서 개선해봅니다

## 개발 과정

### 요구사항 분석

* 초기화의 경우 흑/백 Pawn 을 각각 8개 초기화한다.
* 턴은 백색부터 시작
* Board 는 체스말의 이동에 대한 입력/검증/처리(계산)/형식/출력 을 담당한다.
  * Pawn 이동에 대한 입력을 받는다.
  * Pawn 이동 입력을 검증하고 처리한다.
  * Pawn 이동 결과에 대한 처리(점수 계산)를 한다.
  * 결과를 콘솔에 출력한다.
* (현재는 Unit-Test 로만 결과를 검증한다)

### 설계

필요한 객체 및 타입들은 다음과 같다.

이는 다른 의미로 요구사항 구현을 위해 필요한 역할들을 정의한 것이다.

1. (class) Board : 체스판 전체
2. (class) Pawn : 체스말 중 폰
3. (enum) Row / Column : 열(1~8)과 행(A~H)
4. (enum) PieceType : 체스말 타입 색과 이동가능한 방향을 가짐
5. (enum) Color: 체스말 색
6. (enum) MoveDirection : 체스말이 이동할 수 있는 방향
7. (protocol) Piece: 체스말이 구현해야할 프로토콜

### 개발

설계 단계에서 고민한 각각의 객체에 대해 다음의 역할을 부여한다.

1. Board
  - A1~H8 까지의 데이터 (8\*8 = 64) 저장
  - 초기화할 때 Pawn 도 같이 초기화. A2~H8 에 흑색 Pawn 8개, A7~H7 에 백색 Pawn 8개 를 생성
  - 흑색과 백색 점수값을 저장
  - 흑색과 백색 누구의 턴인지 저장하는 값과 private func 저장
  - 말을 이동하는 함수를 생성
  - MoveDirection 입력을 받으면 해당하는 Pawn 위치, 점수를 변경
2. Pawn
  - 자신의 종류, 색, 이동가능한 방향을 저장
  - Piece 프로토콜 구현
3. Row, Column
  - Row case 는 1~8
  - Column case 는 A~H
  - String 을 상속하여 rawValue 가 이름을 의미
  - Equatable 을 구현
4. PieceType
  - 체스말의 종류를 정의
  - case 로는 pawn 만을 가짐
  - Equatable 을 구현
5. Color
  - case 로 white, black 을 가짐
  - Equatable 을 구현
6. MoveDirection
  - case 로 up, upRight, right, downRight, down, downLeft, left, upLeft 를 가짐
  - Equatable 을 구현
7. Piece
  - PieceType, Color, MoveDirection
  - MoveDirection 을 입력할 시 MoveDirection 이 가능한지 검증
  - Color, PieceType 에 대한 검증
   
### 검증

개발한 기능에 대해 상태, 출력, 통신 기반 테스트를 이용하여 검증한다.

1. Board
  - 연속적인 이동을 하고 다음의 내용을 상태 기반 테스트한다. 점수, 말의 갯수, 누구의 턴.
  - 위의 연속적인 이동 중 제대로 MoveDirection 에 대한 이동을 수행하는지 출력 기반 테스트로 검증한다.
  - 이동이 가능할 것으로 예상되는 MoveDirection 이 어떤 Pawn 을 이동하는지 여부를 통신 기반 테스트로 검증한다.
2. Pawn
  - 이동방향 입력에 대해 정확한 결과를 반환하는지 출력 기반 테스트로 검증한다.
3. PieceType
  - 자체적으로 만든 Mock 객체가 Pawn 과 똑같이 동작하는지 출력 기반 테스트로 검증한다.
