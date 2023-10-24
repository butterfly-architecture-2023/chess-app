//
//  QueenTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class QueenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_F5위치의_Queen이_움직일_수_있는_모든_위치_확인() {
        let queen = Queen(color: .black)
        let movablePositions = queen.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [.init(rank: .five, file: .C), .init(rank: .four, file: .C), .init(rank: .three, file: .C)])
        
        let expectedResult: Set<Position> = [
            .init(rank: .five, file: .C),
            .init(rank: .four, file: .C),
            .init(rank: .three, file: .C)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
