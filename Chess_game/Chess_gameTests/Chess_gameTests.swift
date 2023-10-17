//
//  Chess_gameTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/13/23.
//

import XCTest
@testable import Chess_game

final class Chess_gameTests: XCTestCase {
    var sut: Board!

    override func setUpWithError() throws {
        sut = Board()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    // MARK: Board 생성 테스트
    func test_보드_생성_후_init시_정해진_사이즈와_체스말_숫자로_생성되는지() {
        let defaultMap = sut.map
        let defaultChessPiecesCount = sut.chessPieces.count

        XCTAssertEqual(defaultMap, [])
        XCTAssertEqual(defaultChessPiecesCount, 0)

        sut.initBoardMap()
        sut.initPieces()

        let mockMap = Array(repeating: Array(repeating: ".", count: Rank.allCases.count), count: File.allCases.count)
        let mockChessPiecesCount = 16
        let MapAfterInit = sut.map
        let chessPiecesCountAfterInit = sut.chessPieces.count

        XCTAssertEqual(MapAfterInit, mockMap)
        XCTAssertEqual(chessPiecesCountAfterInit, mockChessPiecesCount)
    }

    func test_보드_생성시_폰들이_정해진_위치에_있는지() {
        sut.initBoardMap()
        let mockMap1: [[String]] = [[".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]]
        let initBoardMap = sut.display()
        XCTAssertEqual(mockMap1, initBoardMap)

        sut.initPieces()
        let mockMap2: [[String]] = [[".", ".", ".", ".", ".", ".", ".", "."], ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"], [".", ".", ".", ".", ".", ".", ".", "."]]
        let initBoardMapWithPieces = sut.display()
        XCTAssertEqual(mockMap2, initBoardMapWithPieces)
    }

    // MARK: -- Pawn 이동 테스트
    
    func test_특정위치로_말이_이동한후_맵이_정상적으로_바뀌는가() {
        let mockBlackPawnPosition1: BoardPosition = (rank: .one, file: .A)
        let mockBlackPawnPosition2: BoardPosition = (rank: .two, file: .A)
        let mockWhitePawnPosition1: BoardPosition = (rank: .three, file: .A)
        let mockWhitePawnPosition2: BoardPosition = (rank: .four, file: .A)

        let mockWhitePawn1: WhitePawn = .init(position: mockWhitePawnPosition1)
        let mockWhitePawn2: WhitePawn = .init(position: mockWhitePawnPosition2)

        let mockBlackPawn1: BlackPawn = .init(position: mockBlackPawnPosition1)
        let mockBlackPawn2: BlackPawn = .init(position: mockBlackPawnPosition2)

        let initMap = [["♟", ".", ".", ".", ".", ".", ".", "."], ["♟", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]]
        sut = Board(chessPieces: [mockBlackPawn1, mockBlackPawn2, mockWhitePawn1, mockWhitePawn2])
        sut.initBoardMap()
        XCTAssertEqual(initMap, sut.display())

        // 가지 못함
        sut.move(mockBlackPawnPosition1, mockWhitePawnPosition1)
        XCTAssertEqual(initMap, sut.display())
        let mockKillAndMoveMap = [["♟", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]]

        // 이동하면서 말을 잡음
        sut.move(mockWhitePawnPosition1, mockBlackPawnPosition2)
        XCTAssertEqual(mockKillAndMoveMap, sut.display())

        let mockJustMoveMap = [["♟", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], ["♙", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "."]]

        // 이동만 함
        sut.move(mockWhitePawnPosition2, (.three, .A))
        XCTAssertEqual(mockJustMoveMap, sut.display())
        var board = String(sut.display().flatMap({$0}).joined())
        var index = board.index(board.startIndex, offsetBy: 8)

        while index < board.endIndex {
            board.insert(contentsOf: "\n", at: index)
            index = board.index(index, offsetBy: 8 + "\n".count)
        }

        print(board)


    }

    func test_특정위치_체스말을_찾는지_못찾는지() {
        let allRank = Rank.allCases
        let allFile = File.allCases
        let allPosition = zip(allRank, allFile).map { (rank, file) in
            BoardPosition(rank,file)
        }

        for position in allPosition {
            let foundPiece = sut.findPiece(position)
            XCTAssertNil(foundPiece)
        }

        for position in allPosition {
            let mockChessPiece: BlackPawn = .init(position: position)
            sut = Board(chessPieces: [mockChessPiece])
            guard let foundPiece = sut.findPiece(position) else { return XCTFail("원하는 체스말을 찾지 못했습니다.")}

            XCTAssertEqual(foundPiece.position.file, mockChessPiece.position.file)
            XCTAssertEqual(foundPiece.position.rank, mockChessPiece.position.rank)
            XCTAssertEqual(foundPiece.isAlive, mockChessPiece.isAlive)
            XCTAssertEqual(foundPiece.type, mockChessPiece.type)
        }
    }

    func test_이동_하려는곳이_다른팀의_말인지_아닌지() {
        let mockWhitePawnPosition1: BoardPosition = (rank: .one, file: .A)
        let mockWhitePawnPosition2: BoardPosition = (rank: .one, file: .B)
        let mockBlackPawnPosition1: BoardPosition = (rank: .one, file: .C)
        let mockBlackPawnPosition2: BoardPosition = (rank: .one, file: .D)

        let mockWhitePawn1: WhitePawn = .init(position: mockWhitePawnPosition1)
        let mockWhitePawn2: WhitePawn = .init(position: mockWhitePawnPosition2)
        let mockBlackPawn1: BlackPawn = .init(position: mockBlackPawnPosition1)
        let mockBlackPawn2: BlackPawn = .init(position: mockBlackPawnPosition2)

        sut = Board(chessPieces: [mockBlackPawn1, mockBlackPawn2, mockWhitePawn1, mockWhitePawn2])

        let canGoCase1 = sut.validateIsDifferentTeam(mockWhitePawnPosition1, mockBlackPawnPosition1)
        let canGoCase2 = sut.validateIsDifferentTeam(mockWhitePawnPosition1, mockBlackPawnPosition2)
        let canGoCase3 = sut.validateIsDifferentTeam(mockBlackPawnPosition1, mockWhitePawnPosition1)
        let canGoCase4 = sut.validateIsDifferentTeam(mockBlackPawnPosition1, mockWhitePawnPosition2)

        XCTAssertTrue(canGoCase1)
        XCTAssertTrue(canGoCase2)
        XCTAssertTrue(canGoCase3)
        XCTAssertTrue(canGoCase4)

        let canNotGoCase1 = sut.validateIsDifferentTeam(mockWhitePawnPosition1, mockWhitePawnPosition2)
        let canNotGoCase2 = sut.validateIsDifferentTeam(mockWhitePawnPosition2, mockWhitePawnPosition1)
        let canNotGoCase3 = sut.validateIsDifferentTeam(mockBlackPawnPosition1, mockBlackPawnPosition2)
        let canNotGoCase4 = sut.validateIsDifferentTeam(mockBlackPawnPosition2, mockBlackPawnPosition1)

        XCTAssertFalse(canNotGoCase1)
        XCTAssertFalse(canNotGoCase2)
        XCTAssertFalse(canNotGoCase3)
        XCTAssertFalse(canNotGoCase4)
    }

    func test_폰이_한칸씩_이동_할수있는_위치인지_아닌지() {
        let mockWhitePawnPosition1: BoardPosition = (rank: .one, file: .A)
        let mockWhitePawnPosition2: BoardPosition = (rank: .two, file: .A)
        let mockWhitePawnPosition3: BoardPosition = (rank: .three, file: .A)
        let mockWhitePawnPosition4: BoardPosition = (rank: .two, file: .B)
        let mockDeadWhitePawnPosition: BoardPosition = (rank: .two, file: .A)

        let mockBlackPawnPosition1: BoardPosition = (rank: .one, file: .C)
        let mockBlackPawnPosition2: BoardPosition = (rank: .two, file: .C)
        let mockBlackPawnPosition3: BoardPosition = (rank: .three, file: .C)
        let mockBlackPawnPosition4: BoardPosition = (rank: .one, file: .D)
        let mockDeadBlackPawnPosition: BoardPosition = (rank: .two, file: .C)

        let mockWhitePawn1: WhitePawn = .init(position: mockWhitePawnPosition1)
        let mockWhitePawn2: WhitePawn = .init(position: mockWhitePawnPosition2)
        let mockWhitePawn3: WhitePawn = .init(position: mockWhitePawnPosition3)
        let mockWhitePawn4: WhitePawn = .init(position: mockWhitePawnPosition4)
        var mockWhiteDeadPawn: WhitePawn = .init(position: mockDeadWhitePawnPosition)
        mockWhiteDeadPawn.isAlive = false

        let mockBlackPawn1: BlackPawn = .init(position: mockBlackPawnPosition1)
        let mockBlackPawn2: BlackPawn = .init(position: mockBlackPawnPosition2)
        let mockBlackPawn3: BlackPawn = .init(position: mockBlackPawnPosition3)
        let mockBlackPawn4: BlackPawn = .init(position: mockBlackPawnPosition4)
        var mockBlackDeadPawn: WhitePawn = .init(position: mockDeadBlackPawnPosition)
        mockBlackDeadPawn.isAlive = false

        sut = Board(chessPieces: [mockBlackPawn1, mockBlackPawn2, mockBlackPawn3, mockBlackPawn4,
                                  mockWhitePawn1, mockWhitePawn2, mockWhitePawn3, mockWhitePawn4,
                                  mockWhiteDeadPawn, mockBlackDeadPawn
                                 ])
        // 갈수 있을때(흰색)
        // rank 내림차순 1씩 가능
        XCTAssertTrue(sut.validateCanGo(mockWhitePawnPosition2, mockWhitePawnPosition1))
        XCTAssertTrue(sut.validateCanGo(mockWhitePawnPosition3, mockWhitePawnPosition2))

        // 갈수 있을때(검정)
        // rank 오름차순 1씩 가능
        XCTAssertTrue(sut.validateCanGo(mockBlackPawnPosition1, mockBlackPawnPosition2))
        XCTAssertTrue(sut.validateCanGo(mockBlackPawnPosition2, mockBlackPawnPosition3))
        
        // 갈수 없을때(이미 죽은상태)
        XCTAssertTrue(sut.validateCanGo(mockDeadWhitePawnPosition, mockWhitePawnPosition1))

        XCTAssertTrue(sut.validateCanGo(mockBlackPawnPosition1, mockDeadBlackPawnPosition))

        // 갈 수 없을때(두칸이상 차이나서)
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition3, mockWhitePawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition1, mockWhitePawnPosition3))

        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition3, mockBlackPawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition1, mockBlackPawnPosition3))

        // 갈수 없을때(file이 달라서)
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition4, mockWhitePawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition1, mockWhitePawnPosition4))

        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition4, mockBlackPawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition1, mockBlackPawnPosition4))

        // 갈 수 없을때(같은 위치라서)
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition1, mockWhitePawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockWhitePawnPosition2, mockWhitePawnPosition2))

        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition1, mockBlackPawnPosition1))
        XCTAssertFalse(sut.validateCanGo(mockBlackPawnPosition2, mockBlackPawnPosition2))
    }

    func test_체스말을_죽였을때_살아있는_체스말의_숫자_변화가_일어나는지() {
        sut.initBoardMap()
        sut.initPieces()
        let defaultIsAliveCount = sut.chessPieces.filter { $0.isAlive }.count
        XCTAssertEqual(defaultIsAliveCount, 16)

        let positions = sut.chessPieces.map { $0.position }
        var remainPiecesCount = 16
        for position in positions {
            sut.kill(position)
            let isAliveCount = sut.chessPieces.filter { $0.isAlive }.count
            remainPiecesCount -= 1
            XCTAssertEqual(isAliveCount, remainPiecesCount)
        }
    }

    func test_특정_위치의_체스말을_죽였을때_특정_체스말의_상태_변화가_일어나는지() {
        let positions = sut.chessPieces.map { $0.position }

        for position in positions {
            guard let selectedPiece = sut.chessPieces.filter({ $0.position == position }).first else { return XCTFail("조건에 맞는 말을 찾지 못했습니다")}
            let isAliveBeforeKill = selectedPiece.isAlive
            XCTAssertTrue(isAliveBeforeKill)

            sut.kill(position)

            guard let selectedPiece = sut.chessPieces.filter({ $0.position == position }).first else { return XCTFail("조건에 맞는 말을 찾지 못했습니다")}
            let isAliveAfterKill = selectedPiece.isAlive
            XCTAssertFalse(isAliveAfterKill)

            XCTAssertNotEqual(isAliveBeforeKill, isAliveAfterKill)
        }
    }

    func test_체스말을_죽였을때_각팀의_점수변화가_일어나는지() {
        var blackTeamScore = 0
        var whiteTeamScore = 0

        let positions = sut.chessPieces.map { $0.position }

        for position in positions {
            sut.kill(position)
            guard let piece = sut.chessPieces.first(where: { $0.position == position }) else { return XCTFail("조건에 맞는 말을 찾지 못했습니다")}
            if piece.type == .black {
                whiteTeamScore += 1
                let expectedBlackTeamScore = sut.getPoint(.black)
                XCTAssertEqual(whiteTeamScore, expectedBlackTeamScore)
            } else {
                blackTeamScore += 1
                let expectedWhiteTeamScore = sut.getPoint(.white)
                XCTAssertEqual(whiteTeamScore, expectedWhiteTeamScore)
            }
        }
    }

}
