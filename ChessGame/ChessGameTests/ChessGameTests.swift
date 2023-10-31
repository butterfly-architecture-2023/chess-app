//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by 강호성 on 10/14/23.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {

    private var sut: ChessBoard!

    override func setUp() {
        sut = ChessBoard()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_display_함수는_1rank_부터_8rank까지_문자열_배열로_리턴하는지() {
        let display = sut.display()
        let displayLines = display.components(separatedBy: "\n").dropLast()

        XCTAssertEqual(displayLines.count, 8)

        for rank in 0..<displayLines.count {
            let rankString = getExpectedRankString(forRank: Rank.allCases[rank])
            XCTAssertEqual(displayLines[rank], rankString)
        }
    }

    func test_초기화_1에서_2rank는_흑색_체스말이_7에서_8rank는_백색_체스말이_위치하는지() {
        for rank in Rank.allCases {
            for file in File.allCases {
                let piece = sut.board[rank.rawValue - 1][file.rawValue]

                let expectedColor: Color
                if rank == .one || rank == .two {
                    expectedColor = .black
                } else if rank == .seven || rank == .eight {
                    expectedColor = .white
                } else {
                    continue
                }

                let shouldBeNil = file == .d && (rank == .one || rank == .eight)

                if shouldBeNil {
                    XCTAssertNil(piece)
                } else {
                    XCTAssertNotNil(piece)
                    XCTAssertEqual(piece?.color, expectedColor)
                }
            }
        }
    }

    func test_movePiece() {
        let fromPosition = Position(rank: .two, file: .a)
        let toPosition = Position(rank: .three, file: .a)
        XCTAssertTrue(sut.canMove(from: fromPosition, to: toPosition))
    }
}

// MARK: - Helpers
extension ChessGameTests {
    private func getExpectedRankString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        let pieces = sut.board[rank.rawValue - 1].compactMap { $0?.icon.unicode ?? "." }
        return rankString + pieces.joined()
    }
}
