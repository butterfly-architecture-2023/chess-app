//
//  KnightTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game

final class KnightTests: XCTestCase {

    func test_movablePositions_Knight가_움직일_수_있는_포지션을_가지고_오는가() {
        let blackKnight = BlackKnight(position: .init(rank: .six, file: .C))
        // 중간에 아무도 없을 때
        let expectedPositions_1: [Position] =
        [
            .init(rank: .four, file: .B),
            .init(rank: .five, file: .A),

            .init(rank: .four, file: .D),
            .init(rank: .five, file: .E),

            .init(rank: .seven, file: .A),
            .init(rank: .eight, file: .B),

            .init(rank: .eight, file: .D),
            .init(rank: .seven, file: .E),
        ]
        XCTAssertEqual(blackKnight.getMoveablePositions(pieces: []), expectedPositions_1)

        // 중간에 같은 팀이 있을 때
        let expectedPositions_2: [Position] =
        [
            .init(rank: .four, file: .B),
            .init(rank: .five, file: .A),

            .init(rank: .four, file: .D),
            .init(rank: .five, file: .E),

            .init(rank: .eight, file: .B),

            .init(rank: .eight, file: .D),
            .init(rank: .seven, file: .E),
        ]
        XCTAssertEqual(blackKnight.getMoveablePositions(pieces: [BlackKnight(position: .init(rank: .seven, file: .A))]), expectedPositions_2)

        // 중간에 다른 팀이 있을 때
        let expectedPositions_3: [Position] =
        [
            .init(rank: .four, file: .B),
            .init(rank: .five, file: .A),

            .init(rank: .four, file: .D),
            .init(rank: .five, file: .E),

            .init(rank: .seven, file: .A),
            .init(rank: .eight, file: .B),

            .init(rank: .eight, file: .D),
            .init(rank: .seven, file: .E),
        ]

        XCTAssertEqual(blackKnight.getMoveablePositions(pieces: [WhiteKnight(position: .init(rank: .seven, file: .A))]), expectedPositions_3)
    }

}
