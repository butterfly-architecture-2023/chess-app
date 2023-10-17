//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/18.
//

import XCTest
@testable import ChessGame

import XCTest

final class BoardTests: XCTestCase {

    func testHasPieces_체스말_존재_시_TRUE_반환() {
        let board = Board(square: [[.init(category: .pawn(color: .black))]])
        XCTAssertTrue(board.hasPieces)
    }
    
    func testHasPieces_체스말_미존재_시_FALSE_반환() {
        let board = Board(square: [[.init(category: .empty)]])
        XCTAssertFalse(board.hasPieces)
    }

    
    func testScore_검은_폰_1개_하얀_폰_2개_존재_시_각_1점_2점_반환() {
        let board = Board(square: [[.init(category: .pawn(color: .black)),
                                    .init(category: .pawn(color: .white)),
                                    .init(category: .pawn(color: .white))]])
        let sut = board.score() == (1, 2)
        XCTAssertTrue(sut)
    }
    
    func testDisplay_검은_폰_1개_하얀_폰_1개_비어있는_체스판_1곳_일_때_각_유니코드로_변환된_2차원_배열_반환() {
        // 검은 폰 "\u{265F}"
        // 하얀 폰 "\u{2659}"
        // 빈 곳  "\u{002E}"
        let board = Board(square: [[.init(category: .pawn(color: .black)),
                                    .init(category: .pawn(color: .white)),
                                    .init(category: .empty)]])
        let sut = board.display()
        XCTAssertEqual(sut, [["\u{265F}", "\u{2659}", "\u{002E}"]])
    }
    
    func testGameStart_게임_시작_시점에_체스보드_위_체스말이_특정_위치에_초기화_되는지_확인() {
        // 체스보드 위에 체스말이 초기화 되는 위치
        // 8x8 2차원 
        // 검은 폰 - row = 1 인 곳
        // 하얀 폰 - row = 6 인 곳
        
        let board = Board()
        board.gameStart()
        
        var startedSquare = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        startedSquare[1] = startedSquare[1].map{ _ in Piece(category: .pawn(color: .black)) }
        startedSquare[6] = startedSquare[6].map{ _ in Piece(category: .pawn(color: .white)) }

        XCTAssertEqual(board.square, startedSquare)
    }
    
    func testMovePawn_체스보드_맨_위에_검은_폰이_위치했을_때_폰을_움직일_수_있는지_확인() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[0] = square[0].map{ _ in Piece(category: .pawn(color: .black)) }
        
        let board = Board(square: square)

        XCTAssertTrue(board.movePawn(rank: 0, file: 0))
    }
    
    func testMovePawn_체스보드_맨_위에_하얀_폰이_위치했을_때_폰을_움직일_수_없는지_확인() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[0] = square[0].map{ _ in Piece(category: .pawn(color: .white)) }
        
        let board = Board(square: square)

        XCTAssertFalse(board.movePawn(rank: 0, file: 0))
    }
    
    func testMovePawn_체스보드_맨_아래에_검은_폰이_위치했을_때_폰을_움직일_수_없는지_확인() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .black)) }
        
        let board = Board(square: square)

        XCTAssertFalse(board.movePawn(rank: 7, file: 7))
    }
    
    func testMovePawn_체스보드_맨_아래에_하얀_폰이_위치했을_때_폰을_움직일_수_있는지_확인() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .white)) }
        
        let board = Board(square: square)

        XCTAssertTrue(board.movePawn(rank: 7, file: 7))
    }
    
    func testMovePawn_하얀_폰이_이동하려는_위치에_같은_말이_있을_때_FALSE_반환() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[6] = square[6].map{ _ in Piece(category: .pawn(color: .white)) }
        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .white)) }
        
        let board = Board(square: square)

        XCTAssertFalse(board.movePawn(rank: 7, file: 7))
    }
    
    func testMovePawn_검은_폰이_이동하려는_위치에_같은_말이_있을_때_FALSE_반환() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        square[3] = square[3].map{ _ in Piece(category: .pawn(color: .black)) }
        square[4] = square[4].map{ _ in Piece(category: .pawn(color: .black)) }
        
        let board = Board(square: square)

        XCTAssertFalse(board.movePawn(rank: 3, file: 6))
    }
    
    func testMovePawn_체크말이_없는_곳에서_이동하려고_할_때_FALSE_반환() {
        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
        
        let board = Board(square: square)

        XCTAssertFalse(board.movePawn(rank: 3, file: 6))
    }
}
