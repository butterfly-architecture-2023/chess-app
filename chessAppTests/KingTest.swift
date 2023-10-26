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
    
    func test_king이_오른쪽으로_한칸_이동함() {
        var sut = King(position: Position(rank: 0, file: 0), color: .black)
        let didMove = sut.move(rank: 0, file: 1)
        XCTAssertTrue(didMove)
    }
  
    func test_King이_왼쪽으로_한칸_이동함() {
        var sut = King(position: Position(rank: 5, file: 5), color: .white)
        let didMove = sut.move(rank: 0, file: -1)
        XCTAssertTrue(didMove)
    }
  
    func test_King이_오른쪽이동으로_오른쪽_경계를_넘을수없음() {
        var sut = King(position: Position(rank: 0, file: 7), color: .black)
        let didMove = sut.move(rank: 0, file: 1)
        XCTAssertFalse(didMove)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
