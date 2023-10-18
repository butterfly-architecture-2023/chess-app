//
//  board_p1_t1.swift
//  ChessAppTests
//
//  Created by leeyeon2 on 10/18/23.
//

import XCTest
@testable import ChessApp
// 한개의 기능 클래스에서 테스트 케이스 별로 작성할 때,
// 한 XCTestCase 클래스에 여러 메소드를 넣는건지 (test_moveToNext1,test_moveToNext2....메소드 생성)
// XCTestCase클래스를 여러개 만드는건지 궁금합니다. (board_p1_t1,board_p1_t2....클래스 생성)

// positive negative 나누는 것이 좋은지 궁금합니다.
final class board_p1_t1: XCTestCase {
    let board = Board()
    
    func test_moveToNext1(){
        let result = board.moveToNext(current: "A7", next: "A6")
        XCTAssert(result == true)
    }
 
    func test_moveToNext2(){
        board.moveToNext(current: "A7", next: "A6")
        let result = board.moveToNext(current: "B2", next: "B3")
        XCTAssert(result == true)
    }
    
    func test_moveToNext3(){
        board.playerTurn = Pawn.black
        let result = board.moveToNext(current: "B2", next: "B3")
        XCTAssert(result == true)
    }
    
    func test_moveToNext4(){
        board.playerTurn = Pawn.black
        let result = board.moveToNext(current: "B2", next: "B3")
        XCTAssert(result == true)
    }
    
    func test_moveToNext5(){
        board.moveToNext(current: "A7", next: "A6")
        board.moveToNext(current: "B2", next: "B3")
        let result = board.moveToNext(current: "A6", next: "A5")
        XCTAssert(result == true)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
