//
//  PawnTests.swift
//  SwiftChessTests
//
//  Created by JK on 2022/06/23.
//

import XCTest

class PawnTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testPawn_점수는_1점() throws {
        let black = BlackPawn()
        let white = WhitePawn()
        XCTAssertEqual(black.point, 1)
        XCTAssertEqual(white.point, 1)
    }
}

class BlackPawnTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testBlackPawn_코드비교_성공() throws {
        let black = BlackPawn()
        let blackCode = "♟"
        XCTAssertEqual(black.code, blackCode)
    }
    
    func testBlackPawn_초기위치_비교성공() {
        let blackPawn : Piece & Pawn = BlackPawn()
        var goodLocations : Set<Position>  { [Position(rank: .R2, column: .A),
                                              Position(rank: .R2, column: .B),
                                              Position(rank: .R2, column: .C),
                                              Position(rank: .R2, column: .D),
                                              Position(rank: .R2, column: .E),
                                              Position(rank: .R2, column: .F),
                                              Position(rank: .R2, column: .G),
                                              Position(rank: .R2, column: .H)] }
        XCTAssertEqual(blackPawn.initialLocations, goodLocations)
    }
        
    func testBlackPawn_현재위치_fromB2_toB3_이동성공() {
        var blackPawn : Piece & Pawn = BlackPawn()
        blackPawn.current = Position(rank: .R2, column: .B)
        blackPawn.current = Position(rank: .R3, column: .B)
        XCTAssertNotEqual(blackPawn.current, Position(rank: .R2, column: .B))
        XCTAssertEqual(blackPawn.current, Position(rank: .R3, column: .B))
    }
    
    func testBlackPawn_fromB2_이동가능한위치_비교성공() {
        var blackPawn : Piece & Pawn = BlackPawn()
        blackPawn.current = Position(rank: .R2, column: .B)
        let possibles = [Position(rank: .R3, column: .B)]
        XCTAssertEqual(blackPawn.possiblePositions(), possibles)
    }

}

class WhitePawnTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testWhitePawn_코드비교_성공() throws {
        let white = BlackPawn()
        let whiteCode = "♙"
        XCTAssertEqual(white.code, whiteCode)
    }
}

