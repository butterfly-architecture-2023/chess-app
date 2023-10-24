//
//  BishopTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class BishopTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_C8위치의_Bishop이_움직일_수_있는_모든_위치_확인() {
        let bishop = Bishop(color: .white)
        let movablePositions = bishop.getMovableAllPositions(from: .init(rank: .eight, file: .C), with: [.init(rank: .eight, file: .D)])
        
        let expectedResult: Set<Position> = []
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
