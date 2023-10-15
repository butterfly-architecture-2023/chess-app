//
//  PostionTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class PostionTests: XCTestCase {
    func testA1위치의_Postion을_생성할_수_있다() {
        let position = Position("A1")
        XCTAssertEqual(position.rank, Position.Rank(0))
        XCTAssertEqual(position.file, Position.File(0))
    }
    
    func testA8위치의_Postion을_생성할_수_있다() {
        let position = Position("A8")
        XCTAssertEqual(position.rank, Position.Rank(7))
        XCTAssertEqual(position.file, Position.File(0))
    }
    
    func testH1위치의_Postion을_생성할_수_있다() {
        let position = Position("H1")
        XCTAssertEqual(position.rank, Position.Rank(0))
        XCTAssertEqual(position.file, Position.File(7))
    }
    
    func testH8위치의_Postion을_생성할_수_있다() {
        let position = Position("H8")
        XCTAssertEqual(position.rank, Position.Rank(7))
        XCTAssertEqual(position.file, Position.File(7))
    }
    
    func testA0위치의_Postion을_생성할_수_없다() {
        let position = Position(String("A0"))
        XCTAssertNil(position)
    }
    
    func testA9위치의_Postion을_생성할_수_없다() {
        let position = Position(String("A9"))
        XCTAssertNil(position)
    }
    
    func test가1위치의_Position을_생성할_수_없다() {
        let position = Position(String("가1"))
        XCTAssertNil(position)
    }
    
    func testI1위치의_Position을_생성할_수_없다() {
        let position = Position(String("I1"))
        XCTAssertNil(position)
    }
}
