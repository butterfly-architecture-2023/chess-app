//
//  PawnTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class PawnTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_7B위치의_Pawn이_움직일_수_있는_모든_위치_확인() {
        let pawn = Pawn(color: .white)
        let movablePositions = pawn.getMovableAllPositions(from: .init(rank: .seven, file: .B))
        
        let expectedResult: Set<Position> = [
            .init(rank: .six, file: .B)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
