//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/18.
//

import XCTest
@testable import ChessGame

final class BoardTests: XCTestCase {

    func testHasPieces_체스말_존재_시_TRUE_반환() {
        guard let position = Position(file: "A", rank: 6) else {
            XCTFail("position is nil")
            return
        }

        let board = Board(pieces: [position: BlackPawn()])
        
        XCTAssertTrue(board.hasPieces)
    }
    
    func testHasPieces_체스말_미존재_시_FALSE_반환() {
        let board = Board()
        
        XCTAssertFalse(board.hasPieces)
    }

    
    func testScore_검은_폰_1개_하얀_폰_2개_존재_시_각_1점_2점_반환() {

        guard let firstPosition = Position(file: "A", rank: 6),
              let secondPosition = Position(file: "A", rank: 2),
              let thirdPosition = Position(file: "A", rank: 3) else {
            XCTFail("position is nil")
            return
        }
        
        let board = Board(pieces: [firstPosition: BlackPawn(),
                                  secondPosition: WhitePawn(),
                                   thirdPosition: BlackPawn()])

        let sut = board.score() == (2, 1)
        XCTAssertTrue(sut)
    }
    
    func testGameStart_게임_시작_시점에_체스보드_위_체스말이_특정_위치에_초기화_되는지_확인() {

        let board = Board()
        board.gameStart()
        
        let sut = board.display().map{ "\($0)" }.joined(separator: "\n")
        let target = """
        ["♜", "♞", "♝", ".", "♛", "♝", "♞", "♜"]
        ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"]
        [".", ".", ".", ".", ".", ".", ".", "."]
        [".", ".", ".", ".", ".", ".", ".", "."]
        [".", ".", ".", ".", ".", ".", ".", "."]
        [".", ".", ".", ".", ".", ".", ".", "."]
        ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"]
        ["♖", "♘", "♗", ".", "♕", "♗", "♘", "♖"]
        """

        XCTAssertEqual(sut, target)
    }
//    
//    func testMovePawn_체스보드_맨_위에_검은_폰이_위치했을_때_폰을_움직일_수_있는지_확인() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[0] = square[0].map{ _ in Piece(category: .pawn(color: .black)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertTrue(board.movePawn(current: .init(file: 0, rank: 0)))
//    }
//    
//    func testMovePawn_체스보드_맨_위에_하얀_폰이_위치했을_때_폰을_움직일_수_없는지_확인() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[0] = square[0].map{ _ in Piece(category: .pawn(color: .white)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertFalse(board.movePawn(current: .init(file: 0, rank: 0)))
//    }
//    
//    func testMovePawn_체스보드_맨_아래에_검은_폰이_위치했을_때_폰을_움직일_수_없는지_확인() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .black)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertFalse(board.movePawn(current: .init(file: 7, rank: 7)))
//    }
//    
//    func testMovePawn_체스보드_맨_아래에_하얀_폰이_위치했을_때_폰을_움직일_수_있는지_확인() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .white)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertTrue(board.movePawn(current: .init(file: 7, rank: 7)))
//    }
//    
//    func testMovePawn_하얀_폰이_이동하려는_위치에_같은_말이_있을_때_FALSE_반환() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[6] = square[6].map{ _ in Piece(category: .pawn(color: .white)) }
//        square[7] = square[7].map{ _ in Piece(category: .pawn(color: .white)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertFalse(board.movePawn(current: .init(file: 7, rank: 7)))
//    }
//    
//    func testMovePawn_검은_폰이_이동하려는_위치에_같은_말이_있을_때_FALSE_반환() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        square[3] = square[3].map{ _ in Piece(category: .pawn(color: .black)) }
//        square[4] = square[4].map{ _ in Piece(category: .pawn(color: .black)) }
//        
//        let board = Board(square: square)
//
//        XCTAssertFalse(board.movePawn(current: .init(file: 6, rank: 3)))
//    }
//    
//    func testMovePawn_체크말이_없는_곳에서_이동하려고_할_때_FALSE_반환() {
//        var square = Array(repeating: Array(repeating: Piece(category: .empty), count: 8), count: 8)
//        
//        let board = Board(square: square)
//
//        XCTAssertFalse(board.movePawn(current: .init(file: 6, rank: 3)))
//    }
}
