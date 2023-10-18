//
//  pawn_n1_t1.swift
//  ChessAppTests
//
//  Created by leeyeon2 on 10/18/23.
//

import XCTest
@testable import ChessApp

final class pawn_n1_t1: XCTestCase {
    let board = Board()
    
    func setUp(key: String) -> [Int]{
        //추후 plist 파일로 변경 예정
        switch key{
        case "test_nextLocation1()":
            return [9,9]
        default:
            return []
        }
    }
    
    func test_nextLocation1(){
        let key = #function
        let result = Pawn.nextLocation(currentLocation: setUp(key: key), board: board.board)
        XCTAssert(result == [])
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
