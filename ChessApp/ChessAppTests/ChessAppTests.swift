//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChessBoardInit() throws {
        let testResult =
        """
         ABCDEFGH
        1........
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8........
         ABCDEFGH
        """
        
        let displayResult = ChessBoard().display()
        XCTAssertEqual(testResult, displayResult)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
