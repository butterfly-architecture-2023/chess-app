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
    
    func testMovePiece_게임_시작_시점에_모든_검은_폰은_아래로_한칸_움직일_수_있다() {
        let board = Board()
        let blackPawnStartPositions = BlackPawn.initialPositions()
        
        // 체스판 시작지점에 체스말 초기화
        // ["♜", "♞", "♝", ".", "♛", "♝", "♞", "♜"]
        // ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"]
        // ["♖", "♘", "♗", ".", "♕", "♗", "♘", "♖"]
        board.gameStart()
        
        blackPawnStartPositions.forEach { (position, blackPawn) in
            if let bottomPosition = position.bottomPosition() {
                let canMove = board.movePiece(from: position, to: bottomPosition)
                XCTAssertTrue(canMove)
            }
        }
    }
    
    func testMovePiece_게임_시작_시점에_모든_하얀_폰이_위로_한칸_움직일_수_있다() {
        let board = Board()
        let whitePawnStartPositions = WhitePawn.initialPositions()
        
        // 체스판 시작지점에 체스말 초기화
        // ["♜", "♞", "♝", ".", "♛", "♝", "♞", "♜"]
        // ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // [".", ".", ".", ".", ".", ".", ".", "."]
        // ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"]
        // ["♖", "♘", "♗", ".", "♕", "♗", "♘", "♖"]
        board.gameStart()
        
        whitePawnStartPositions.forEach { (position, whitePawn) in
            if let topPosition = position.topPosition() {
                let canMove = board.movePiece(from: position, to: topPosition)
                XCTAssertTrue(canMove)
            }
        }
    }
}
