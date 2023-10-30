//
//  PairChessTests.swift
//  PairChessTests
//
//  Created by 김혜지 on 10/26/23.
//

import XCTest
@testable import PairChess

final class PairChessTests: XCTestCase {
    func test_블랙킹이_정해진_위치에_만들어지는지() {
        let positionD1 = Position(file: .D, rank: .one)
        let allPositionsWithoutD1: [Position] = zip(File.allCases, Rank.allCases).compactMap { file, rank in
            Position(file: file, rank: rank)
        }
        // 잘 만들어 질 때
        let king: King? = BlackKing(position: positionD1!)
        XCTAssertNotNil(king)
        // 잘 만들어 지지 않을 때
        for position in allPositionsWithoutD1 {
            let king = BlackKing(position: position)
            XCTAssertNil(king)
        }
    }
    func test_화이트킹이_정해진_위치에_만들어지는지() {
        var allPositionsWithoutD8: [Position] = zip(File.allCases, Rank.allCases).filter { file, rank in
            return file != .D && rank != .eight
        }
        // 잘 만들어 질 때
        let king: King? = WhiteKing(position: (.D, .eight))
        XCTAssertNotNil(king)
        // 잘 만들어 지지 않을 때
        for position in allPositionsWithoutD8 {
            let king = WhiteKing(position: position)
            XCTAssertNil(king)
        }
    }
}
