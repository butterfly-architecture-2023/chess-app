//
//  BishopTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game
final class BishopTests: XCTestCase {

    func test_movablePositions_Bishop이_움직일_수_있는_포지션을_가지고_오는가() {
        let blackBishop = BlackBishop(position: .init(rank: .four, file: .D))
        // 중간에 아무것도 없을 때
        let expectedPositions_1: [Position] =
        [
            .init(rank: .three, file: .C),
            .init(rank: .two, file: .B),
            .init(rank: .one, file: .A),

            .init(rank: .three, file: .E),
            .init(rank: .two, file: .F),
            .init(rank: .one, file: .G),

            .init(rank: .five, file: .C),
            .init(rank: .six, file: .B),
            .init(rank: .seven, file: .A),

            .init(rank: .five, file: .E),
            .init(rank: .six, file: .F),
            .init(rank: .seven, file: .G),
            .init(rank: .eight, file: .H),
        ]
        XCTAssertEqual(blackBishop.getMoveablePositions(pieces: []), expectedPositions_1)

        // 중간에 같은 팀이 있을때
        let expectedPositions_2: [Position] =
        [
            .init(rank: .three, file: .C),
            .init(rank: .two, file: .B),
            .init(rank: .one, file: .A),

            .init(rank: .three, file: .E),

            .init(rank: .five, file: .C),
            .init(rank: .six, file: .B),
            .init(rank: .seven, file: .A),

            .init(rank: .five, file: .E),
            .init(rank: .six, file: .F),
            .init(rank: .seven, file: .G),
            .init(rank: .eight, file: .H),
        ]
        XCTAssertEqual(blackBishop.getMoveablePositions(pieces: [BlackPawn(position: .init(rank: .two, file: .F))]), expectedPositions_2)

        // 중간에 다른 팀이 있을때
        let expectedPositions_3: [Position] =
        [
            .init(rank: .three, file: .C),
            .init(rank: .two, file: .B),
            .init(rank: .one, file: .A),

            .init(rank: .three, file: .E),
            .init(rank: .two, file: .F),

            .init(rank: .five, file: .C),
            .init(rank: .six, file: .B),
            .init(rank: .seven, file: .A),

            .init(rank: .five, file: .E),
            .init(rank: .six, file: .F),
            .init(rank: .seven, file: .G),
            .init(rank: .eight, file: .H),
        ]
        XCTAssertEqual(blackBishop.getMoveablePositions(pieces: [WhitePawn(position: .init(rank: .two, file: .F))]), expectedPositions_3)
    }

}
