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
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
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
        let fromPosition = Position(rank: 7, column: .a)
        let toPosition = Position(rank: 6, column: .e)
        let canMove = sut.canMovePawn(pawnType: .white, fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(canMove)
    }
    
    func test_블랙Pawn이_알맞는_이동요청을_성공하는가() {
        let fromPosition = Position(rank: 2, column: .c)
        let toPosition = Position(rank: 3, column: .c)
        let moveResult = sut.movePawn(fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertTrue(moveResult)
    }
    
    func test_화이트Pawn이_알맞는_이동요청을_성공하는가() {
        let fromPosition = Position(rank: 7, column: .a)
        let toPosition = Position(rank: 6, column: .a)
        let moveResult = sut.movePawn(fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertTrue(moveResult)
    }
    
    func test_Pawn이_없는_칸을_이동할떄_실패하는가() {
        let fromPosition = Position(rank: 1, column: .a)
        let toPosition = Position(rank: 2, column: .a)
        let moveResult = sut.movePawn(fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(moveResult)
    }
    
    func test_블랙Pawn이_다른_Column에_이동요청을_실패하는가() {
        let fromPosition = Position(rank: 2, column: .c)
        let toPosition = Position(rank: 3, column: .a)
        let moveResult = sut.movePawn(fromPosition: fromPosition, toPosition: toPosition)
        XCTAssertFalse(moveResult)
    }
    
    func test_화이트Pawn이_다른_Column에_이동요청을_실패하는가() {
        let fromPosition = Position(rank: 7, column: .a)
        let toPosition = Position(rank: 6, column: .h)
        let moveResult = sut.movePawn(fromPosition: fromPosition, toPosition: toPosition)
        sut.display()
        XCTAssertFalse(moveResult)
    }
}
