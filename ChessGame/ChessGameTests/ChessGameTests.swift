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

    /// display() 함수는 1-rank부터 8-rank까지 rank 문자열 배열로 보드 위에 체스말을 리턴한다.
    func test_displayReturnsChessBoardState() {
        let display = sut.display()
        let displayLines = display.components(separatedBy: "\n").dropLast()

        XCTAssertEqual(displayLines.count, 8)

        for rank in 0..<displayLines.count {
            let rankString = getExpectedRankString(forRank: Rank.allCases[rank])
            XCTAssertEqual(displayLines[rank], rankString)
        }
    }

    private func getExpectedRankString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        let pieces = sut.board[rank.rawValue - 1].compactMap { $0?.icon ?? "." }
        return rankString + pieces.joined()
    }
}
