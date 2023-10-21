//
//  ChessTests.swift
//  ChessTests
//
//  Created by ByungHoon Ann on 2023/10/16.
//

import XCTest

final class ChessTests: XCTestCase {
    var sut: Board!
    
    override func setUp() {
        sut = Board()
        super.setUp()
        sut.display()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_유효한_입력값_제공시_Position리턴이_nil이_아닌가1() {
        let text = "A2->A3"
        let result = sut.makeInputPositions(text: text)
        XCTAssertNotNil(result)
    }
    
    func test_유효하지_않은_입력값_제공시_Position리턴이_nil인가1() {
        let text = "A2->33"
        let result = sut.makeInputPositions(text: text)
        XCTAssertNil(result)
    }
    
    func test_유효하지_않은_입력값_제공시_Position리턴이_nil인가2() {
        let text = "ㄴ2->33"
        let result = sut.makeInputPositions(text: text)
        XCTAssertNil(result)
    }
    
    func test_유효하지_않은_입력값_제공시_Position리턴이_nil인가4() {
        let text = "->"
        let result = sut.makeInputPositions(text: text)
        XCTAssertNil(result)
    }
    
    func test_Board를_초기화_했을때_체스말이_존재하는가() {
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_주어진_Rank_초과한_값에_접근_했을_경우_빈값을_리턴하는가() {
        let position = Position(rank: 99, column: .a)
        let blackPawn = sut.checkPawnType(position: position)
        XCTAssertEqual(blackPawn, PawnType.none)
    }
    
    func test_주어진_Rank_1미만에_접근_했을_경우_빈값을_리턴하는가() {
        let position = Position(rank: 0, column: .a)
        let blackPawn = sut.checkPawnType(position: position)
        XCTAssertEqual(blackPawn, PawnType.none)
    }
    
    func test_지정한_위치에_블랙Pawn이_존재하는가() {
        let position = Position(rank: 2, column: .a)
        let blackPawn = sut.checkPawnType(position: position)
        XCTAssertEqual(blackPawn, PawnType.black)
    }
    
    func test_지정한_위치에_화이트Pawn이_존재하는가()  {
        let position = Position(rank: 7, column: .d)
        let whitePawn = sut.checkPawnType(position: position)
        XCTAssertEqual(whitePawn, PawnType.white)
    }
    
    func test_지정한_위치에_폰이_없는가() {
        let position = Position(rank: 5, column: .h)
        let emptyPawn = sut.checkPawnType(position: position)
        XCTAssertEqual(emptyPawn, PawnType.none)
    }

    func test_블랙Pawn을_1높은_랭크로_이동_요청을_할때_이동이_가능한가() {
        let fromPosition = Position(rank: 2, column: .c)
        let toPosition = Position(rank: 3, column: .c)
        let canMove = sut.canMovePawn(pawnType: .black, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertTrue(canMove)
    }
    
    func test_화이트Pawn을_1낮은_Rank로_이동_요청을_할때_이동이_가능한가() {
        let fromPosition = Position(rank: 7, column: .a)
        let toPosition = Position(rank: 6, column: .a)
        let canMove = sut.canMovePawn(pawnType: .white, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertTrue(canMove)
    }
    
    func test_BlackPawn을_2Rank_이상_이동_요청을_할때_이동이_불가능한가() {
        let fromPosition = Position(rank: 2, column: .g)
        let toPosition = Position(rank: 4, column: .g)
        let canMove = sut.canMovePawn(pawnType: .black, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(canMove)
    }
    
    func test_블랙Pawn을_현재Rank_더낮은_Rank로_이동_요청을_할때_이동이_불가능한가() {
        let fromPosition = Position(rank: 2, column: .c)
        let toPosition = Position(rank: 1, column: .c)
        let canMove = sut.canMovePawn(pawnType: .black, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(canMove)
    }
    
    func test_화이트Pawn을_1낮은_Rank로_이동_요청을_할때_이동이_불가능한가() {
        let fromPosition = Position(rank: 7, column: .b)
        let toPosition = Position(rank: 8, column: .b)
        let canMove = sut.canMovePawn(pawnType: .white, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(canMove)
    }
    
    func test_블랙Pawn이_Rank는_같지만_Column이_다른_위치_이동요청이_실패하는가() {
        let fromPosition = Position(rank: 2, column: .c)
        let toPosition = Position(rank: 3, column: .d)
        let canMove = sut.canMovePawn(pawnType: .black, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(canMove)
    }
    
    func test_화이트Pawn이_Rank는_같지만_Column이_다른_위치_이동요청이_실패하는가() {
        let a7toa6 = "A2->A3"
        let canMove = sut.requestMovePawn(inputText: a7toa6)
        XCTAssertFalse(canMove)
    }
    
    func test_블랙Pawn이_알맞는_이동요청을_성공하는가() {
        let c2toc3 = "C2->C3"
        let moveResult = sut.requestMovePawn(inputText: c2toc3)
        XCTAssertTrue(moveResult)
    }
    
    func test_화이트Pawn이_알맞는_이동요청을_성공하는가() {
        let a7toa6 = "A7->A6"
        let moveResult = sut.requestMovePawn(inputText: a7toa6)
        XCTAssertTrue(moveResult)
    }
    
    func test_Pawn이_없는_칸을_이동할떄_실패하는가() {
      
        let a1toa2 = "A1->A2"
        let moveResult = sut.requestMovePawn(inputText: a1toa2)
        XCTAssertFalse(moveResult)
    }
    
    func test_블랙Pawn이_다른_Column에_이동요청을_실패하는가() {
        let c2toa3 = "C2->A3"
        let moveResult = sut.requestMovePawn(inputText: c2toa3)
        XCTAssertFalse(moveResult)
    }
    
    func test_화이트Pawn이_다른_Column에_이동요청을_실패하는가() {
        let a7toh6 = "A7->H6"
        let moveResult = sut.requestMovePawn(inputText: a7toh6)
        sut.display()
        XCTAssertFalse(moveResult)
    }
}
