//
//  KingTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/1/23.
//

import XCTest
@testable import Chess_game

final class KingTests: XCTestCase {

    func test_movablePositions_King이_움직일_수_있는_포지션을_가지고_오는가() {
        let king = BlackKing(position: .init(rank: .four, file: .B))

        let expectedPositions_1: [Position] = [
            .init(rank: .four, file: .A),
            .init(rank: .four, file: .C),
            .init(rank: .five, file: .B),
            .init(rank: .three, file: .B),
        ]

        XCTAssertEqual(king.getMoveablePositions(pieces: []), expectedPositions_1)
    }

}
