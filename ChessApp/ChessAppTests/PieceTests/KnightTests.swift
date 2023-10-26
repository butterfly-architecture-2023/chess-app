//
//  KnightTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/26.
//

import XCTest
@testable import ChessApp

final class KnightTests: XCTestCase {
    private var sut: Knight!

    override func setUpWithError() throws {
        self.sut = Knight(color: .white, currentPosition: Position(file: .D, rank: .four))
    }

    func test_canMove메서드_성공케이스() {
        XCTAssertTrue(self.sut.canMove(to: Position(file: .B, rank: .three)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .B, rank: .five)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .C, rank: .two)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .C, rank: .six)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .E, rank: .two)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .E, rank: .six)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .F, rank: .three)))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .F, rank: .five)))
    }
    
    func test_canMove메서드_실패케이스() {
        XCTAssertFalse(self.sut.canMove(to: Position(file: .D, rank: .five)))
    }
}
