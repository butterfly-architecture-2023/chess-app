//
//  PawnTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game

final class PawnTests: XCTestCase {

    func test_movablePositions_Pawn이_움직일_수_있는_포지션을_가지고_오는가() {
        // 앞에 아무것도 없을 때(black)
        let blackPawnPosition_1 = Position(rank: .one, file: .A)
        let blackPawn_1 = BlackPawn(color: .black, isAlive: true, position: blackPawnPosition_1)
        let expectedPositions_1 = [Position(rank: .two, file: .A)]
        let pieces_1: [Piece] = .init([blackPawn_1])
        let movablePositions_1 = blackPawn_1.getMoveablePositions(pieces: pieces_1)
        XCTAssertEqual(movablePositions_1, expectedPositions_1)

        // 앞에 아무것도 없을 때(white)
        let whitePawnPosition_1 = Position(rank: .eight, file: .A)
        let whitePawn_1 = WhitePawn(color: .white, isAlive: true, position: whitePawnPosition_1)
        let expectedPositions_2 = [Position(rank: .seven, file: .A)]
        let pieces_2: [Piece] = .init([whitePawn_1])
        let movablePositions_2 = whitePawn_1.getMoveablePositions(pieces: pieces_2)
        XCTAssertEqual(movablePositions_2, expectedPositions_2)

        // 앞에 같은 팀이 있을 때(black)
        let blackPawnPosition_2 = Position(rank: .one, file: .A)
        let blackPawnPosition_3 = Position(rank: .two, file: .A)
        let blackPawn_2 = BlackPawn(color: .black, isAlive: true, position: blackPawnPosition_2)
        let blackPawn_3 = BlackPawn(color: .black, isAlive: true, position: blackPawnPosition_3)
        let pieces_3: [Piece] = .init([blackPawn_2, blackPawn_3])
        let movablePositions_3 = blackPawn_2.getMoveablePositions(pieces: pieces_3)
        XCTAssertEqual(movablePositions_3, [])

        // 앞에 같은 팀이 있을 때(white)
        let whitePawnPosition_2 = Position(rank: .one, file: .A)
        let whitePawnPosition_3 = Position(rank: .two, file: .A)
        let whitePawn_2 = WhitePawn(color: .white, isAlive: true, position: whitePawnPosition_2)
        let whitePawn_3 = WhitePawn(color: .white, isAlive: true, position: whitePawnPosition_3)
        let pieces_4: [Piece] = .init([whitePawn_2, whitePawn_3])
        let movablePositions_4 = whitePawn_2.getMoveablePositions(pieces: pieces_4)
        XCTAssertEqual(movablePositions_4, [])

        // 보드의 최대 길이까지 도달했을 때(black)
        let blackPawnPosition_4 = Position(rank: .eight, file: .A)
        let blackPawn_4 = BlackPawn(color: .black, isAlive: true, position: blackPawnPosition_4)
        let pieces_5: [Piece] = .init([BlackPawn(color: .black, isAlive: true, position: blackPawnPosition_4)])
        let movablePositions_5 = blackPawn_4.getMoveablePositions(pieces: pieces_5)
        XCTAssertEqual(movablePositions_5, [])

        // 보드의 최대 길이까지 도달했을 때(white)
        let whitePawnPosition_4 = Position(rank: .one, file: .A)
        let whitePawn_4 = WhitePawn(color: .white, isAlive: true, position: whitePawnPosition_4)
        let pieces_6: [Piece] = .init([whitePawn_4])
        let movablePositions_6 = whitePawn_4.getMoveablePositions(pieces: pieces_6)
        XCTAssertEqual(movablePositions_6, [])
    }

}
