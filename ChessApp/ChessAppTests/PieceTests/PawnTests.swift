//
//  PawnTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/24.
//

import XCTest
@testable import ChessApp

final class PawnTests: XCTestCase {
    
    func test_canMove메서드_성공케이스_블랙폰() {
        let blackPawn = Pawn(color: .black, currentPosition: Position(file: .A, rank: .one))
        let destination = Position(file: .A, rank: .two)
        XCTAssertTrue(blackPawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_블랙폰_아래로_내려가지_않을_때() {
        let blackPawn = Pawn(color: .black, currentPosition: Position(file: .A, rank: .two))
        let destination = Position(file: .A, rank: .one)
        XCTAssertFalse(blackPawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_블랙폰_한칸이_아닌_두칸을_가려고_할_때() {
        let blackPawn = Pawn(color: .black, currentPosition: Position(file: .A, rank: .one))
        let destination = Position(file: .A, rank: .three)
        XCTAssertFalse(blackPawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_블랙폰_대각선으로_이동할_때() {
        let blackPawn = Pawn(color: .black, currentPosition: Position(file: .A, rank: .one))
        let destination = Position(file: .B, rank: .two)
        XCTAssertFalse(blackPawn.canMove(to: destination))
    }
    
    func test_canMove메서드_성공케이스_화이트폰() {
        let whitePawn = Pawn(color: .white, currentPosition: Position(file: .A, rank: .eight))
        let destination = Position(file: .A, rank: .seven)
        XCTAssertTrue(whitePawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_화이트폰_위로_올라가지_않을_때() {
        let whitePawn = Pawn(color: .white, currentPosition: Position(file: .A, rank: .seven))
        let destination = Position(file: .A, rank: .eight)
        XCTAssertFalse(whitePawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_화이트폰_한칸이_아닌_두칸을_가려고_할_때() {
        let whitePawn = Pawn(color: .white, currentPosition: Position(file: .A, rank: .eight))
        let destination = Position(file: .B, rank: .six)
        XCTAssertFalse(whitePawn.canMove(to: destination))
    }
    
    func test_canMove메서드_실패케이스_화이트폰_대각선으로_이동할_때() {
        let whitePawn = Pawn(color: .white, currentPosition: Position(file: .A, rank: .eight))
        let destination = Position(file: .B, rank: .seven)
        XCTAssertFalse(whitePawn.canMove(to: destination))
    }
}
