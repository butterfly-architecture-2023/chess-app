//
//  PositionTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 11/2/23.
//

import XCTest
@testable import Chess_game
final class PositionTests: XCTestCase {
    
    func test_getNearPosition() {
        let position = Position(rank: .three, file: .B)

        let left = position.getNearPosition(.left)
        let right = position.getNearPosition(.right)
        let bottom = position.getNearPosition(.bottom)
        let top = position.getNearPosition(.top)
        let topLeftDiagonal = position.getNearPosition(.topLeftDiagonal)
        let topRightDiagonal = position.getNearPosition(.topRightDiagonal)
        let bottomLeftDiagonal = position.getNearPosition(.bottomLeftDiagonal)
        let bottomRightDiagonal = position.getNearPosition(.bottomRightDiagonal)

        XCTAssertEqual(left, .init(rank: .three, file: .A))
        XCTAssertEqual(right, .init(rank: .three, file: .C))
        XCTAssertEqual(bottom, .init(rank: .four, file: .B))
        XCTAssertEqual(top, .init(rank: .two, file: .B))
        XCTAssertEqual(topLeftDiagonal, .init(rank: .two, file: .A))
        XCTAssertEqual(topRightDiagonal, .init(rank: .two, file: .C))
        XCTAssertEqual(bottomLeftDiagonal, .init(rank: .four, file: .A))
        XCTAssertEqual(bottomRightDiagonal, .init(rank: .four, file: .C))
    }
}
