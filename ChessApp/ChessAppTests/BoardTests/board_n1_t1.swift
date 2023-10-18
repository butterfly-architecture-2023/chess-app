//
//  board_n1_t1.swift
//  ChessAppTests
//
//  Created by leeyeon2 on 10/18/23.
//

import XCTest
@testable import ChessApp

// negative의 경우 에러코드 값으로 비교를 하고 싶은데 에러코드를 보통 어떻게 설정하는지 궁금합니다.
final class board_n1_t1: XCTestCase {
    let board = Board()
    
    func test_moveToNext1(){
        let result = board.moveToNext(current: "A7", next: "A5")
        XCTAssert(result == false)
    }
 
    func test_moveToNext2(){
        let result = board.moveToNext(current: "A100", next: "A200")
        XCTAssert(result == false)
    }
    
    func test_moveToNext3(){
        let result = board.moveToNext(current: "Z2", next: "Z3")
        XCTAssert(result == false)
    }
    
    func test_moveToNext4(){
        let result = board.moveToNext(current: "B2", next: "B3")
        XCTAssert(result == false)
    }
    
    func test_moveToNext5(){
        board.playerTurn = Pawn.black
        let result = board.moveToNext(current: "B2", next: "B5")
        XCTAssert(result == false)
    }
    
    func test_moveToNext6(){
        board.moveToNext(current: "A7", next: "A6")
        board.moveToNext(current: "B2", next: "B3")
        let result = board.moveToNext(current: "A7", next: "A6")
        XCTAssert(result == false)
    }
    
    func test_moveToNext7(){
        board.moveToNext(current: "A7", next: "A6")
        board.moveToNext(current: "B2", next: "B3")
        let result = board.moveToNext(current: "A6", next: "A7")
        XCTAssert(result == false)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
