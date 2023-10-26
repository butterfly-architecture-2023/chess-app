//
//  KingTest.swift
//  chessAppTests
//
//  Created by 안상희 on 10/26/23.
//

import XCTest

final class KingTest: XCTestCase {

    
    func test_king이_생성됨() {
        let sut = King(position: Position(rank: 0, file: 0), color: .black)
        XCTAssertEqual(King(position: Position(rank: 0, file: 0), color: .black), sut)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
