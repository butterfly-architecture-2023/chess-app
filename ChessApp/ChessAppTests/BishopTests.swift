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
        let movablePositions = bishop.getMovableAllPositions(from: .init(rank: .five, file: .D), with: [.init(rank: .six, file: .D), .init(rank: .six, file: .E)])
        
        let expectedResult: [[Position]] = [[.init(rank: .six, file: .E), .init(rank: .seven, file: .F), .init(rank: .eight, file: .G)]]
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
