//
//  QueenTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game

final class QueenTests: XCTestCase {

    func test_movablePositions_Queen이_움직일_수_있는_포지션을_가지고_오는가() {
        let queen = BlackQueen(position: .init(rank: .five, file: .D))

        let expectedPositions_1: [Position] =
        [
            .init(rank: .five, file: .C),
            .init(rank: .five, file: .B),
            .init(rank: .five, file: .A),

            .init(rank: .five, file: .E),
            .init(rank: .five, file: .F),
            .init(rank: .five, file: .G),
            .init(rank: .five, file: .H),

            .init(rank: .six, file: .D),
            .init(rank: .seven, file: .D),
            .init(rank: .eight, file: .D),

            .init(rank: .four, file: .D),
            .init(rank: .three, file: .D),
            .init(rank: .two, file: .D),
            .init(rank: .one, file: .D),

            .init(rank: .four, file: .C),
            .init(rank: .three, file: .B),
            .init(rank: .two, file: .A),

            .init(rank: .four, file: .E),
            .init(rank: .three, file: .F),
            .init(rank: .two, file: .G),
            .init(rank: .one, file: .H),

            .init(rank: .six, file: .C),
            .init(rank: .seven, file: .B),
            .init(rank: .eight, file: .A),

            .init(rank: .six, file: .E),
            .init(rank: .seven, file: .F),
            .init(rank: .eight, file: .G),
        ]
        
        XCTAssertEqual(queen.getMoveablePositions(pieces: []), expectedPositions_1)
    }
}
