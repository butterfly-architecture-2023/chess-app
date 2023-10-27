//
//  ChessBoardTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class ChessBoardTests: XCTestCase {
    
    let chessBoard = ChessBoard()
    
    let boardInitDisplay =
        """
         ABCDEFGH
        1♜♞♝.♛♝♞♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChessBoardInit() throws {
        let displayResult = chessBoard.display()
        XCTAssertEqual(boardInitDisplay, displayResult)
    }
    
    func test_움직이려는_piece에_근접한_Position_중_기물이_없는_Position_확인() throws {
        let result = chessBoard.getMovableNeighborDirections(from: .init(rank: .eight, file: .E))
        let expectedValue: Set<Position> = [
            .init(rank: .eight, file: .D)
        ]
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_체스말을_여러번_움직여_이동_가능_여부_확인() throws {
        let whiteFirstMove = try chessBoard.canMove(by: "E7->E6")
        let blackFirstMove = try chessBoard.canMove(by: "D2->D3")
        let whiteSecondMove = try chessBoard.canMove(by: "E6->E5")
        let blackSecondMove = try chessBoard.canMove(by: "D3->D4")
        let whiteThirdMove = try chessBoard.canMove(by: "C7->C6")
        let blackThirdMove = try chessBoard.canMove(by: "C1->E3")
        XCTAssertTrue(blackThirdMove)
    }
}
