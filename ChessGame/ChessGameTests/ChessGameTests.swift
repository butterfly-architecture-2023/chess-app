//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by Dongyoung Kwon on 2023/10/13.
//

import XCTest

final class ChessGameTests: XCTestCase {
    
    private var sut: Board!
    
    override func setUp() {
        super.setUp()
        
        sut = Board()
        sut.setUpPieces(type: Pawn.self)
        sut.setUpPieces(type: Bishop.self)
        sut.setUpPieces(type: Rook.self)
        sut.setUpPieces(type: Queen.self)
        sut.setUpPieces(type: Knight.self)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
//    override func setUpWithError() throws {
//    }
//
//    override func tearDownWithError() throws {
//    }
    
    func test_board_생성후_display_확인() throws {
        let expectedBoard = [
            "♜♞♝.♛♝♞♜",
            "♟♟♟♟♟♟♟♟",
            "........",
            "........",
            "........",
            "........",
            "♙♙♙♙♙♙♙♙",
            "♖♘♗.♕♗♘♖"
        ]
        
        let result = sut.display()
        
        XCTAssertEqual(result, expectedBoard)
    }
    
    func test_룩이_움직일수있는포지션_성공케이스() throws {
        sut.move(from: .init(rank: .seven, file: .A),
                 to: .init(rank: .six, file: .A))
        sut.move(from: .init(rank: .two, file: .A),
                 to: .init(rank: .three, file: .A))
        sut.move(from: .init(rank: .six, file: .A),
                 to: .init(rank: .five, file: .A))
        sut.move(from: .init(rank: .three, file: .A),
                 to: .init(rank: .four, file: .A))
        sut.move(from: .init(rank: .five, file: .A),
                 to: .init(rank: .four, file: .A))
        
        let rookAvailableMovingCoordinates = sut.movableCoordinates(from: .init(
            rank: .one,
            file: .A
        ))
        
        XCTAssertEqual(rookAvailableMovingCoordinates, [
            .init(rank: .two, file: .A),
            .init(rank: .three, file: .A),
            .init(rank: .four, file: .A)
        ])
    }
    
    func test_체스말이동_성공케이스_이동할수있는가() throws {
        sut.move(from: .init(rank: .seven, file: .A),
                 to: .init(rank: .six, file: .A))
        
        let expectedBoard = [
            "♜♞♝.♛♝♞♜",
            "♟♟♟♟♟♟♟♟",
            "........",
            "........",
            "........",
            "♙.......",
            ".♙♙♙♙♙♙♙",
            "♖♘♗.♕♗♘♖"
        ]
        
        let result = sut.display()
        
        XCTAssertEqual(result, expectedBoard)
    }
    
    func test_체스말이동_실패케이스_이동할수없는위치로_이동한경우() {
        let expectedFalse = sut.move(from: .init(rank: .two, file: .A),
                                     to: .init(rank: .four, file: .A))
        
        XCTAssertFalse(expectedFalse)
    }
    
    func test_체스말이동_성공케이스_이동할때_상대말을_잘제거하는가() {
        sut.move(from: .init(rank: .seven, file: .A),
                 to: .init(rank: .six, file: .A))
        sut.move(from: .init(rank: .two, file: .A),
                 to: .init(rank: .three, file: .A))
        sut.move(from: .init(rank: .six, file: .A),
                 to: .init(rank: .five, file: .A))
        sut.move(from: .init(rank: .three, file: .A),
                 to: .init(rank: .four, file: .A))
        sut.move(from: .init(rank: .five, file: .A),
                 to: .init(rank: .four, file: .A))
        
        let expectedBoard = [
            "♜♞♝.♛♝♞♜",
            ".♟♟♟♟♟♟♟",
            "........",
            "♙.......",
            "........",
            "........",
            ".♙♙♙♙♙♙♙",
            "♖♘♗.♕♗♘♖"
        ]
        
        let result = sut.display()
        
        XCTAssertEqual(result, expectedBoard)
    }
    
    func test_점수계산_성공케이스() {
        sut.move(from: .init(rank: .seven, file: .A),
                 to: .init(rank: .six, file: .A))
        sut.move(from: .init(rank: .two, file: .A),
                 to: .init(rank: .three, file: .A))
        sut.move(from: .init(rank: .six, file: .A),
                 to: .init(rank: .five, file: .A))
        sut.move(from: .init(rank: .three, file: .A),
                 to: .init(rank: .four, file: .A))
        sut.move(from: .init(rank: .five, file: .A),
                 to: .init(rank: .four, file: .A))
        
        XCTAssertEqual(sut.getScore().black, 38)
        XCTAssertEqual(sut.getScore().white, 39)
    }
}
