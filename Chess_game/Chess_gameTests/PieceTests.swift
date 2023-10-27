//
//  PieceTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/26/23.
//

import XCTest
@testable import Chess_game

final class PieceTests: XCTestCase {

    func test_특정위치_체스말을_찾는지_못찾는지() {
        let allRank = Rank.allCases
        let allFile = File.allCases
        let allPosition = zip(allRank, allFile).map { (rank, file) in
            Position(rank: rank, file: file)
        }
        let mockChessPieces = allPosition.map { Pawn(color: .black, position: $0) }

        for position in allPosition {
            let mockChessPiece: Piece = Pawn(color: .black, position: position)
            let foundPiece = mockChessPiece.findPiece(pieces: [], with: position)
            XCTAssertNil(foundPiece)
        }

        for position in allPosition {
            let mockChessPiece: Piece = Pawn(color: .black, position: position)
            guard let foundPiece = mockChessPiece.findPiece(pieces: mockChessPieces, with: position) else { return XCTFail("원하는 체스말을 찾지 못했습니다.")}

            XCTAssertEqual(foundPiece.position, mockChessPiece.position)
            XCTAssertEqual(foundPiece.isAlive, mockChessPiece.isAlive)
            XCTAssertEqual(foundPiece.color, mockChessPiece.color)
        }
    }

    func test_이동_하려는곳이_다른팀의_말인지_아닌지() {
        let mockWhitePawnPosition1: Position = .init(rank: .one, file: .A)
        let mockWhitePawnPosition2: Position = .init(rank: .one, file: .B)
        let mockBlackPawnPosition1: Position = .init(rank: .one, file: .C)
        let mockBlackPawnPosition2: Position = .init(rank: .one, file: .D)

        let mockWhitePawn1: Pawn = .init(color: .white, position: mockWhitePawnPosition1)
        let mockWhitePawn2: Pawn = .init(color: .white, position: mockWhitePawnPosition2)
        let mockBlackPawn1: Pawn = .init(color: .black, position: mockBlackPawnPosition1)
        let mockBlackPawn2: Pawn = .init(color: .black, position: mockBlackPawnPosition2)

        let pieces = [mockBlackPawn1, mockBlackPawn2, mockWhitePawn1, mockWhitePawn2]

        let canGoCase1 = mockWhitePawn1.validateIsDifferentTeam(pieces, mockBlackPawnPosition1)
        let canGoCase2 = mockWhitePawn1.validateIsDifferentTeam(pieces, mockBlackPawnPosition2)
        let canGoCase3 = mockBlackPawn1.validateIsDifferentTeam(pieces, mockWhitePawnPosition1)
        let canGoCase4 = mockBlackPawn2.validateIsDifferentTeam(pieces, mockWhitePawnPosition2)


        XCTAssertTrue(canGoCase1)
        XCTAssertTrue(canGoCase2)
        XCTAssertTrue(canGoCase3)
        XCTAssertTrue(canGoCase4)

        let canNotGoCase1 = mockWhitePawn1.validateIsDifferentTeam(pieces, mockWhitePawnPosition2)
        let canNotGoCase2 = mockWhitePawn2.validateIsDifferentTeam(pieces, mockWhitePawnPosition1)
        let canNotGoCase3 = mockBlackPawn1.validateIsDifferentTeam(pieces, mockBlackPawnPosition2)
        let canNotGoCase4 = mockBlackPawn2.validateIsDifferentTeam(pieces, mockBlackPawnPosition1)

        XCTAssertFalse(canNotGoCase1)
        XCTAssertFalse(canNotGoCase2)
        XCTAssertFalse(canNotGoCase3)
        XCTAssertFalse(canNotGoCase4)
    }

    func test_movablePositions_Pawn이_움직일_수_있는_포지션을_가지고_오는가() {
        // 앞에 아무것도 없을 때(black)
        let blackPawnPosition_1 = Position(rank: .one, file: .A)
        let blackPawn_1 = Pawn(color: .black, isAlive: true, position: blackPawnPosition_1)
        let expectedPositions_1 = [Position(rank: .two, file: .A)]
        let pieces_1: [Piece] = .init([blackPawn_1])
        let movablePositions_1 = blackPawn_1.getMoveablePositions(pieces: pieces_1)
        XCTAssertEqual(movablePositions_1, expectedPositions_1)

        // 앞에 아무것도 없을 때(white)
        let whitePawnPosition_1 = Position(rank: .eight, file: .A)
        let whitePawn_1 = Pawn(color: .white, isAlive: true, position: whitePawnPosition_1)
        let expectedPositions_2 = [Position(rank: .seven, file: .A)]
        let pieces_2: [Piece] = .init([whitePawn_1])
        let movablePositions_2 = whitePawn_1.getMoveablePositions(pieces: pieces_2)
        XCTAssertEqual(movablePositions_2, expectedPositions_2)

        // 앞에 같은 팀이 있을 때(black)
        let blackPawnPosition_2 = Position(rank: .one, file: .A)
        let blackPawnPosition_3 = Position(rank: .two, file: .A)
        let blackPawn_2 = Pawn(color: .black, isAlive: true, position: blackPawnPosition_2)
        let blackPawn_3 = Pawn(color: .black, isAlive: true, position: blackPawnPosition_3)
        let pieces_3: [Piece] = .init([blackPawn_2, blackPawn_3])
        let movablePositions_3 = blackPawn_2.getMoveablePositions(pieces: pieces_3)
        XCTAssertEqual(movablePositions_3, [])

        // 앞에 같은 팀이 있을 때(white)
        let whitePawnPosition_2 = Position(rank: .one, file: .A)
        let whitePawnPosition_3 = Position(rank: .two, file: .A)
        let whitePawn_2 = Pawn(color: .white, isAlive: true, position: whitePawnPosition_2)
        let whitePawn_3 = Pawn(color: .white, isAlive: true, position: whitePawnPosition_3)
        let pieces_4: [Piece] = .init([whitePawn_2, whitePawn_3])
        let movablePositions_4 = whitePawn_2.getMoveablePositions(pieces: pieces_4)
        XCTAssertEqual(movablePositions_4, [])

        // 보드의 최대 길이까지 도달했을 때(black)
        let blackPawnPosition_4 = Position(rank: .eight, file: .A)
        let blackPawn_4 = Pawn(color: .black, isAlive: true, position: blackPawnPosition_4)
        let pieces_5: [Piece] = .init([Pawn(color: .black, isAlive: true, position: blackPawnPosition_4)])
        let movablePositions_5 = blackPawn_4.getMoveablePositions(pieces: pieces_5)
        XCTAssertEqual(movablePositions_5, [])

        // 보드의 최대 길이까지 도달했을 때(white)
        let whitePawnPosition_4 = Position(rank: .one, file: .A)
        let whitePawn_4 = Pawn(color: .white, isAlive: true, position: whitePawnPosition_4)
        let pieces_6: [Piece] = .init([whitePawn_4])
        let movablePositions_6 = whitePawn_4.getMoveablePositions(pieces: pieces_6)
        XCTAssertEqual(movablePositions_6, [])
    }

    func test_movablePositions_Rook이_움직일_수_있는_포지션을_가지고_오는가() {
        // 앞에 아무것도 없을 때
        let rookPosition_1 = Position(rank: .five, file: .D)
        let rook_1 = Rook(color: .black, isAlive: true, position: rookPosition_1)
        let expectedPositions_1 = [
            Position(rank: .five, file: .A),
            Position(rank: .five, file: .B),
            Position(rank: .five, file: .C),
            Position(rank: .five, file: .E),
            Position(rank: .five, file: .F),
            Position(rank: .five, file: .G),
            Position(rank: .five, file: .H),

            Position(rank: .one, file: .D),
            Position(rank: .two, file: .D),
            Position(rank: .three, file: .D),
            Position(rank: .four, file: .D),
            Position(rank: .six, file: .D),
            Position(rank: .seven, file: .D),
            Position(rank: .eight, file: .D),
        ]
        let pieces_1: [Piece] = .init([rook_1])
        let movablePositions_1 = rook_1.getMoveablePositions(pieces: pieces_1)
        for position in movablePositions_1 {
            XCTAssertTrue(expectedPositions_1.contains(position))
        }

        for position in expectedPositions_1 {
            XCTAssertTrue(movablePositions_1.contains(position))
        }

        // 중간에 같은 팀이 있을 때
        let rookPosition_2 = Position(rank: .five, file: .D)
        let rookPosition_3 = Position(rank: .five, file: .B)
        let rook_2 = Rook(color: .black, isAlive: true, position: rookPosition_2)
        let rook_3 = Rook(color: .black, isAlive: true, position: rookPosition_3)
        let expectedPositions_2 =  [Position(rank: .five, file: .C),
                                    Position(rank: .five, file: .E),
                                    Position(rank: .five, file: .F),
                                    Position(rank: .five, file: .G),
                                    Position(rank: .five, file: .H),

                                    Position(rank: .one, file: .D),
                                    Position(rank: .two, file: .D),
                                    Position(rank: .three, file: .D),
                                    Position(rank: .four, file: .D),
                                    Position(rank: .six, file: .D),
                                    Position(rank: .seven, file: .D),
                                    Position(rank: .eight, file: .D),
        ]
        let pieces_2: [Piece] = .init([rook_2, rook_3])
        let movablePositions_2 = rook_2.getMoveablePositions(pieces: pieces_2)
        for position in movablePositions_2 {
            XCTAssertTrue(expectedPositions_2.contains(position))
        }

        for position in expectedPositions_2 {
            XCTAssertTrue(movablePositions_2.contains(position))
        }

        // 중간에 다른 팀이 있을 때
        let rookPosition_4 = Position(rank: .five, file: .D)
        let rookPosition_5 = Position(rank: .five, file: .B)
        let rook_4 = Rook(color: .black, isAlive: true, position: rookPosition_4)
        let rook_5 = Rook(color: .white, isAlive: true, position: rookPosition_5)
        let expectedPositions_3 =  [
            Position(rank: .five, file: .B),
            Position(rank: .five, file: .C),
            Position(rank: .five, file: .E),
            Position(rank: .five, file: .F),
            Position(rank: .five, file: .G),
            Position(rank: .five, file: .H),


            Position(rank: .one, file: .D),
            Position(rank: .two, file: .D),
            Position(rank: .three, file: .D),
            Position(rank: .four, file: .D),
            Position(rank: .six, file: .D),
            Position(rank: .seven, file: .D),
            Position(rank: .eight, file: .D),
        ]
        let pieces: [Piece] = .init([rook_4, rook_5])
        let movablePositions_3 = rook_4.getMoveablePositions(pieces: pieces)
        for position in movablePositions_3 {
            XCTAssertTrue(expectedPositions_3.contains(position))
        }

        for position in expectedPositions_3 {
            XCTAssertTrue(movablePositions_3.contains(position))
        }
    }
}
