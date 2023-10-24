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
        let movablePositions = rook.getMovableAllPositions(from: .init(rank: .five, file: .D), with: [.init(rank: .five, file: .E), .init(rank: .six, file: .E)])
        
        let expectedResult: [[Position]] = [[.init(rank: .five, file: .E), .init(rank: .five, file: .F), .init(rank: .five, file: .G), .init(rank: .five, file: .H)]]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
