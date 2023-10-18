//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by Se Eun Lee on 2023/10/18.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
    var board: Board!

    override func setUpWithError() throws {
        board = Board()
    }

    override func tearDownWithError() throws {
        board = nil
        try super.tearDownWithError()
    }

    func testCreateBoard() {
        XCTAssertEqual(board.board, [:])

        func test(_ color: PieceColor) {
            board.initPiece(color)
            PieceType.allCases(color).forEach { pieceType in
                let pieces = board.getPieces(color).filter { $0.type == pieceType }
                let positions = board.board.filter { ($0.value?.color == color) && ($0.value?.type == pieceType) }.keys

                // 색상별, 타입별 개수 전체 테스트
                XCTAssertEqual(pieces.count, pieceType.initPositions.count, pieceType.icon)
                // 색상별, 타입별 위치 전체 테스트
                XCTAssertEqual(Set(positions), Set(pieceType.initPositions), pieceType.icon)
            }
        }

        test(.black)
        test(.white)

        // 위치 개별 테스트
        XCTAssertEqual(board.getPositionInfo(Position(.two, .A)), Piece(.black, .pawn(.black)))
    }
}
