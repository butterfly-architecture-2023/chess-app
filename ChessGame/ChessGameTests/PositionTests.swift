//
//  PositionTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/26.
//

import XCTest
@testable import ChessGame

final class PositionTests: XCTestCase {

    func testTopPosition_file_0_rank_0에서_topPosition은_없다() {

        let position = Position(file: 0, rank: 0)
        let sut = position?.topPosition()

        XCTAssertNil(sut)
    }
    
    func testTopPosition_file_7_rank_7에서_topPosition은_있다() {

        let position = Position(file: 0, rank: 7)
        let sut = position?.topPosition()

        XCTAssertNotNil(sut)
    }
    
    func testBottomPosition_file_0_rank_0에서_bottomPosition은_있다() {

        let position = Position(file: 0, rank: 0)
        let sut = position?.bottomPosition()

        XCTAssertNotNil(sut)
    }
    
    func testBottomPosition_file_7_rank_7에서_bottomPosition은_없다() {

        let position = Position(file: 7, rank: 7)
        let sut = position?.bottomPosition()

        XCTAssertNil(sut)
    }
    
    func testRightPosition_file_0_rank_0에서_rightPosition은_있다() {

        let position = Position(file: 0, rank: 0)
        let sut = position?.rightPosition()

        XCTAssertNotNil(sut)
    }
    
    func testRightPosition_file_7_rank_7에서_rightPosition은_없다() {

        let position = Position(file: 7, rank: 7)
        let sut = position?.rightPosition()

        XCTAssertNil(sut)
    }
    
    func testLeftPosition_file_0_rank_0에서_LeftPosition은_없다() {

        let position = Position(file: 0, rank: 0)
        let sut = position?.leftPosition()

        XCTAssertNil(sut)
    }
    
    func testLeftPosition_file_7_rank_7에서_leftPosition은_있다() {

        let position = Position(file: 7, rank: 7)
        let sut = position?.leftPosition()
        
        XCTAssertNotNil(sut)
    }
    
    func testLeftPositions_file_7_rank_7에서_leftPositions은_있다() {
        let position = Position(file: 7, rank: 7)
        let sut = position!.leftPositions()
        var target: [Position] = []
        
        for i in 0..<7 {
            if let position = Position(file: 6-i, rank: 7) {
                target.append(position)
            }
        }
        
        XCTAssertEqual(sut, target)
    }
}
