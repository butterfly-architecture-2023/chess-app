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
    private let pieceManager = PieceManager()

    override func setUpWithError() throws {
        self.sut = Knight(color: .white, source: Position(file: .D, rank: .four))
        self.pieceManager.resetPieces()
    }

    func test_canMove메서드_성공케이스() {
        XCTAssertTrue(self.sut.canMove(to: Position(file: .B, rank: .three), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .B, rank: .five), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .C, rank: .two), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .C, rank: .six), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .E, rank: .two), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .E, rank: .six), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .F, rank: .three), pieces: self.pieceManager.pieces))
        XCTAssertTrue(self.sut.canMove(to: Position(file: .F, rank: .five), pieces: self.pieceManager.pieces))
    }
    
    func test_canMove메서드_실패케이스() {
        XCTAssertFalse(self.sut.canMove(to: Position(file: .D, rank: .five), pieces: self.pieceManager.pieces))
    }
}
