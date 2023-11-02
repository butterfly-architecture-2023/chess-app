//
//  RookTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game
final class RookTests: XCTestCase {

    func test_movablePositions_Rook이_움직일_수_있는_포지션을_가지고_오는가() {
        // 앞에 아무것도 없을 때
        let rookPosition_1 = Position(rank: .five, file: .D)
        let rook_1 = BlackRook(color: .black, isAlive: true, position: rookPosition_1)
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
        let rook_2 = BlackRook(color: .black, isAlive: true, position: rookPosition_2)
        let rook_3 = BlackRook(color: .black, isAlive: true, position: rookPosition_3)
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
        let rook_4 = BlackRook(color: .black, isAlive: true, position: rookPosition_4)
        let rook_5 = BlackRook(color: .white, isAlive: true, position: rookPosition_5)
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
