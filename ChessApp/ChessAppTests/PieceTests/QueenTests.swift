//
//  QueenTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/26.
//

import XCTest
@testable import ChessApp

final class QueenTests: XCTestCase {
    private var sut: Queen!

    override func setUpWithError() throws {
        self.sut = Queen(color: .white, source: Position(file: .D, rank: .five))
    }
    
    func test_canMove메서드_성공케이스_대각선_G_2_로_이동할_때() {
        XCTAssertTrue(self.sut.canMove(to: Position(file: .G, rank: .two)))
    }
    
    func test_canMove메서드_성공케이스_대각선_A_5_로_이동할_때() {
        XCTAssertTrue(self.sut.canMove(to: Position(file: .A, rank: .five)))
    }

    func test_canMove메서드_성공케이스_직선_D_2_로_이동할_때() {
        XCTAssertTrue(self.sut.canMove(to: Position(file: .D, rank: .two)))
    }
    
    func test_canMove메서드_실패케이스_지금현재위치로_이동할_때() {
        XCTAssertFalse(self.sut.canMove(to: Position(file: .D, rank: .five)))
    }
}
