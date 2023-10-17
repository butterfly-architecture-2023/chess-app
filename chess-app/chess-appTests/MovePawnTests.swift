//
//  MovePawnTests.swift
//  chess-appTests
//
//  Created by 윤소희 on 2023/10/17.
//

import XCTest
@testable import chess_app

final class MovePawnTests: XCTestCase {
    
    //동일한 색상이 있는 경우, 범위를 벗어난 경우, 상대방 폰 잡는 경우, 기본적인 움직임
    
    var board: [[String]] = Array(repeating: Array(repeating: ".", count: 8), count: 8)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        board[1] = Array(repeating: "\u{265F}", count: 8)
        board[6] = Array(repeating: "\u{2659}", count: 8)
    }
    
    func testMovePawnBoundaryInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "A2", to: "J2", turn: 1)
        XCTAssertFalse(result)
    }
    
    func testMoveBlackPawnValid() {
        let sut = Board()
        let result = sut.movePawn(from: "A2", to: "A3", turn: 1)
        XCTAssertTrue(result)
        XCTAssertEqual(board[2][0], ".")
    }
    
    func testMoveBackBlackPawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "B2", to: "A2", turn: 1)
        XCTAssertFalse(result)
    }
    
    func testMoveBlackPawnInvalidForwardTwice(){
        let sut = Board()
        let result = sut.movePawn(from: "A2", to: "A4", turn: 1)
        XCTAssertFalse(result)
        
    }
    
    func testMoveRightBlackPawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "E2", to: "F2", turn: 5)
        XCTAssertFalse(result)
    }
    
    func testMoveDiagonalBlackPawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "B2", to: "C3", turn: 5)
        XCTAssertFalse(result)
    }
    
    func testMoveBlackPawnCapture() {
        let sut = Board()
        let result = sut.movePawn(from: "E6", to: "E7", turn: 5)
        XCTAssertTrue(result)
        XCTAssertEqual(board[6][4], "\u{2659}")
        }
    
    func testMoveWhitePawnValid() {
        let sut = Board()
        let result = sut.movePawn(from: "D7", to: "D6", turn: 2)
        XCTAssertTrue(result)
    }
    
    func testMoveBackWhitePawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "F7", to: "F8", turn: 4)
        XCTAssertFalse(result)
    }
    
    func testMoveWhitePawnInvalidForwardTwice(){
        let sut = Board()
        let result = sut.movePawn(from: "H7", to: "H5", turn: 4)
        XCTAssertFalse(result)
        
    }
    
    func testMoveLeftWhitePawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "C7", to: "B7", turn: 6)
        XCTAssertFalse(result)
    }
    
    func testMoveDiagonalWhitePawnInvalid() {
        let sut = Board()
        let result = sut.movePawn(from: "A7", to: "B6", turn: 6)
        XCTAssertFalse(result)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
