//
//  PieceManagerTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/25/23.
//

import XCTest
@testable import Chess_game

final class PieceManagerTests: XCTestCase {
    var sut: PieceManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_move_Pawn이_움직인_결과에_따라_piece의_position이_달라졌는가() {
        let testBlackPawnPosition = Position(rank: .one, file: .A)
        let blackPawnPosition_1 = Position(rank: .two, file: .A)
        let whitePawnPosition_1 = Position(rank: .two, file: .A)

        let destination = Position(rank: .two, file: .A)
        
        // 목적지에 아무도 없을 때
        sut = ChessPieceManager([BlackPawn(position: testBlackPawnPosition)])
        let movedPieces_1 = sut.move(from: testBlackPawnPosition, to: destination)
        let movingBlackPawn_1 = movedPieces_1.first
        XCTAssertEqual(movingBlackPawn_1?.position, destination)

        // 목적지에 같은 팀을 만났을 때
        sut = ChessPieceManager([
            BlackPawn(position: testBlackPawnPosition),
            BlackPawn(position: blackPawnPosition_1)
        ])
        let movedPieces_2 = sut.move(from: testBlackPawnPosition, to: destination)
        let movingBlackPawn_2 = movedPieces_2.first
        XCTAssertEqual(movingBlackPawn_2?.position, .init(rank: .one, file: .A))

        // 목적지에 다른 팀을 만났을 때
        sut = ChessPieceManager([
            BlackPawn(position: testBlackPawnPosition),
            WhitePawn(position: whitePawnPosition_1),
        ])

        let movedPieces_3 = sut.move(from: testBlackPawnPosition, to: destination)
        let movingBlackPawn_3 = movedPieces_3.first
        XCTAssertEqual(movingBlackPawn_3?.position, destination)
    }

    func test_move_Pawn이_움직인_결과에_따라_piece의_생존여부가_달라졌는가() {
        let testBlackPawnPosition = Position(rank: .one, file: .A)
        let blackPawnPosition_1 = Position(rank: .two, file: .A)
        let whitePawnPosition_1 = Position(rank: .two, file: .A)

        let destination = Position(rank: .two, file: .A)

        // 움직이지 못함
        sut = ChessPieceManager([
            BlackPawn(position: testBlackPawnPosition),
            BlackPawn(position: blackPawnPosition_1)
        ])
        let movedPieces_1 = sut.move(from: testBlackPawnPosition, to: destination)
        // 따라서 모두 생존
        movedPieces_1.forEach {
            XCTAssertTrue($0.isAlive)
        }

        // 혼자 움직임
        sut = ChessPieceManager([
            BlackPawn(position: testBlackPawnPosition)
        ])
        let movedPieces_2 = sut.move(from: testBlackPawnPosition, to: destination)
        // 따라서 모두 생존
        movedPieces_2.forEach {
            XCTAssertTrue($0.isAlive)
        }

        // 잡으면서 움직임
        sut = ChessPieceManager([
            BlackPawn(position: testBlackPawnPosition),
            WhitePawn(position: whitePawnPosition_1),
        ])
        let movedPieces_3 = sut.move(from: testBlackPawnPosition, to: destination)
        let alivePiece = movedPieces_3.first!
        let diedPiece = movedPieces_3.last!
        // 따라서 움직인 쪽만 살아남음
        XCTAssertTrue(alivePiece.isAlive)
        XCTAssertFalse(diedPiece.isAlive)

    }

}
