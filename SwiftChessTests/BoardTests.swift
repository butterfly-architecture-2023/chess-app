//
//  SwiftChessTests.swift
//  SwiftChessTests
//
//  Created by JK on 2022/06/23.
//

import XCTest

class BoardTests: XCTestCase {
    var board : GameBoard?
    
    override func setUpWithError() throws {
        board = GameBoard()
    }

    override func tearDownWithError() throws {
    }

    func testBoard_Pawn초기생성_B2성공() throws {
        board?.initPiece(type: BlackPawn.self, position: Position(rank: .R2, column: .B))
        //private이라서 어떻게 값을 확인하지?
    }
    
    func testBoard_Pawn_B2에서_가능한위치_비교성공() throws {
        let b2 = Position(rank: .R2, column: .B)
        let b3 = Position(rank: .R3, column: .B)
        board?.initPiece(type: BlackPawn.self, position: b2)
        XCTAssertEqual(try? board?.possibilties(from: b2) ?? [], [b3])
    }

    func testBoard_Pawn_B2에서_B2로_이동성공() throws {
        let b2 = Position(rank: .R2, column: .B)
        let b3 = Position(rank: .R3, column: .B)
        board?.initPiece(type: BlackPawn.self, position: b2)
        XCTAssertEqual(try? board?.move(from: b2, to: b3) ?? false, true)
    }

    func testBoard_BlackPawn1개_Black점수는_1점() throws {
        let b2 = Position(rank: .R2, column: .B)
        board?.initPiece(type: BlackPawn.self, position: b2)
        XCTAssertEqual(board?.points().black, 1)
        XCTAssertEqual(board?.points().white, 0)
    }

}
