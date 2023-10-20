//
//  InputManagerTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/18.
//

import XCTest
@testable import ChessGame

final class InputManagerTests: XCTestCase {

    func testConvertToBoardPosition_체스보드_입력값이_A8일_때_체스보드_좌표인_rank_7_file_0_반환() {
        let sut = InputManager()
        let boardPosition = sut.convertToBoardPosition(from: "A8")
        let rank = boardPosition?.rank
        let file = boardPosition?.file
        
        XCTAssertEqual(rank, 7)
        XCTAssertEqual(file, 0)
    }
    
    func testConvertToBoardPosition_체스보드_입력값이_H1일_때_체스보드_좌표인_rank_0_file_7_반환() {
        let sut = InputManager()
        let boardPosition = sut.convertToBoardPosition(from: "H1")
        let rank = boardPosition?.rank
        let file = boardPosition?.file
        
        XCTAssertEqual(rank, 0)
        XCTAssertEqual(file, 7)
    }

    func testConvertToBoardPosition_체스보드_입력값이_AA일_때_NIL_반환() {
        let sut = InputManager()
        let boardPosition = sut.convertToBoardPosition(from: "AA")
        let rank = boardPosition?.rank
        let file = boardPosition?.file
        
        XCTAssertEqual(rank, nil)
        XCTAssertEqual(file, nil)
    }
    
    func testConvertToBoardPosition_체스보드_입력값이_세_자리_수일_때_NIL_반환() {
        let sut = InputManager()
        let boardPosition = sut.convertToBoardPosition(from: "A1A")
        let rank = boardPosition?.rank
        let file = boardPosition?.file
        
        XCTAssertEqual(rank, nil)
        XCTAssertEqual(file, nil)
    }
}
