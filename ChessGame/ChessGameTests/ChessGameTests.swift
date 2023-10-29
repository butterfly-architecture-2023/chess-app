//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {
    
    var sut: Board!
    
    override func setUp() {
        super.setUp()
        
        sut = Board()
        sut.setUpPieces(type: Pawn.self)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
//    override func setUpWithError() throws {
//    }
//
//    override func tearDownWithError() throws {
//    }
    
    func test_board_생성후_display_확인() throws {
        let expectedBoard = [
            "........",
            "♟♟♟♟♟♟♟♟",
            "........",
            "........",
            "........",
            "........",
            "♙♙♙♙♙♙♙♙",
            "........"
        ]
        
        let result = sut.display()
        
        XCTAssertEqual(result, expectedBoard)
    }
}
