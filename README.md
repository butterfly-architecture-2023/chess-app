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

필요한 객체 및 타입들은 다음과 같다.

이는 다른 의미로 요구사항 구현을 위해 필요한 역할들을 정의한 것이다.

1. (class) Board : 체스판 전체
2. (class) Pawn, Bishop, Knight, Queen : 각 체스말
3. (enum) Row / Column : 열(1~8)과 행(A~H)
4. (enum) PieceType : 체스말 타입 색과 이동가능한 방향을 가짐
  - 제거 이유. Piece 프로토콜이 이미 해당 역할을 수행한다고 생각하였음.
5. (enum) Color : 체스말 색
6. (enum) MoveDirection : 체스말이 이동할 수 있는 방향
7. (enum) BoardResult : 체스판에서 방출할 수 있는 결과 값.
  * 흑색 또는 백색이 점수를 얻음. 각각의 타입이 존재
  * 입력이 올바르지 않음. `String` (사용자의 입력) 포함
  * 도움말 기능 입력에 대한 결과. `[String]` (이동할 수 있는 위치값) 포함
8. (protocol) Piece: 체스말이 구현해야할 프로토콜

### 개발

설계 단계에서 고민한 각각의 객체에 대해 다음의 역할을 부여한다.

개발 순서는 작은 단위부터 큰 구현으로 넘어가도록 한다.

1. Board
  - A1~H8 까지의 데이터 (8\*8 = 64) 저장
  - 초기화할 때 Pawn 도 같이 초기화
    - A1, H1 은 검은색 룩. A7, H7 은 하얀색 룩
    - B1, G1 은 검은색 나이트. B7, G7 은 하얀색 나이트
    - C1, F1 은 검은색 비숍. C7, F7 은 하얀색 비숍
    - E1 은 검은색 퀸. E7 은 하얀색 퀸  
    - A2 ~ H8 에 흑색 폰. A7 ~ H7 에 하얀색 폰
  - 흑색과 백색 점수값을 저장
  - 흑색과 백색 누구의 턴인지 저장
  - 말을 이동하는 함수 생성
    - 만약 말의 목적지에 다른색의 말이 있으면 제거하여 점수 계산
    - 만약 말의 이동경로에 같은 색의 말이 있는 등 이동하지 못하는 경우 관련 결과값을 반환
  - 이동한 결과 대체되는 체스말, 이동시작점, 이동끝점을 통해 점수를 계산하는 함수 생성
    - 점수 계산을 위해 죽은 말을 보관하는 bucket 을 생성. 결과값은 bucket 의 상태를 표현하는 struct 를 반환
  - MoveDirection 입력을 받으면 해당하는 Pawn 위치, 점수를 변경
  - 현재 체스판의 상태를 여러 줄의 String 으로 반환하는 함수 생성
2. Pawn, Bishop, Knight, Queen
  - 자신의 종류, 색, 이동가능한 방향을 저장
  - Piece 프로토콜 구현
3. Row, Column
  - Row case 는 1~8
  - Column case 는 A~H
  - String 을 상속하여 rawValue 가 이름을 의미
  - Equatable 을 구현
4. PieceType
  - 체스말의 종류를 정의
  - case 로는 pawn, rook, bishop, knight, queen 을 가짐 (king 제외)
  - case 별 심볼을 Unicode 값으로 가짐
  - Equatable 을 구현
5. Color
  - case 로 white, black 을 가짐
  - Equatable 을 구현
6. MoveDirection
  - case 로 up, upRight, right, downRight, down, downLeft, left, upLeft 를 가짐
  - Knight 는 직진, 대각선을 동시에 진행하기 때문에 combination 을 추가. combination 은 MoveDirection 배열을 관련 값으로 가진다
  - Equatable 을 구현
7. BoardResult
  - case 로 whiteGotOne, blackGotOne, notValidCommand, boardHelp 를 가짐
  - notValidCommand 는 관련값으로 어떤 커맨드였는지를 가지고 있어야 함
  - boardHelp 는 특정 체스말에 대해 어디로 이동할 수 있는지를 표현해야 함
8. Piece
  - PieceType, Color, MoveDirection
  - MoveDirection 을 입력할 시 MoveDirection 이 가능한지 검증
  - Color, PieceType 에 대한 검증
   
### 검증

개발한 기능에 대해 상태, 출력, 통신 기반 테스트를 이용하여 검증한다.

현재 테스트가 실패하고 있음. 아래의 방향으로 작업을 추가해야 함.
- 구현부분 변경
- 테스트 코드를 새로 작성
- 리팩토링 후 테스트 코드 수정

1. Board
  - 연속적인 이동을 하고 다음의 내용을 상태 기반 테스트한다. 점수, 말의 갯수, 이동 가능 여부, 누구의 턴
  - 최대한 Assert 문은 XCTAssertEqual 로 일원화해본다. Board 는 대부분 BoardResult 를 방출할 것이므로
  - 이동이 가능할 것으로 예상되는 MoveDirection 이 어떤 Pawn 을 이동하는지 여부를 통신 기반 테스트로 검증한다
2. Pawn, Bishop, Knight, Queen
  - 이동방향 입력에 대해 정확한 결과를 반환하는지 출력 기반 테스트로 검증한다
3. Row, Column *(Done)*
  - Board 의 `getPosition(from:String)` 을 통해 경계조건을 테스트
4. PieceType *(Done)*
  - 자체적으로 만든 Mock 객체가 Pawn 과 똑같이 동작하는지 출력 기반 테스트로 검증한다
5. MoveDirection
  - combination 으로 move 로 상태기반 테스트로 검증한다
