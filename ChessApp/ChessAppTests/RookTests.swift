//
//  RookTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class RookTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_D4위치의_Rook이_움직일_수_있는_모든_위치_확인() {
        let rook = Rook(color: .white)
        let movablePositions = rook.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [])
        
        let expectedResult: Set<Position> = [
            .init(rank: .four, file: .A),
            .init(rank: .four, file: .B),
            .init(rank: .four, file: .C),
            .init(rank: .four, file: .E),
            .init(rank: .four, file: .F),
            .init(rank: .four, file: .G),
            .init(rank: .four, file: .H),
            .init(rank: .one, file: .D),
            .init(rank: .two, file: .D),
            .init(rank: .three, file: .D),
            .init(rank: .five, file: .D),
            .init(rank: .six, file: .D),
            .init(rank: .seven, file: .D),
            .init(rank: .eight, file: .D)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
