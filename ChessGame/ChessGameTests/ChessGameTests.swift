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

    /// 초기화할 때 1,2-rank는 흑백 체스말이, 7,8-rank는 백색 체스말이 위치한다.
    func test_InitialBoardSetup() {
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

    /// 특정 말을 옮기는 메소드 유효성 테스트
    func test_movePiece() {
        let fromPosition = Position(rank: .two, file: .a)
        let toPosition = Position(rank: .three, file: .a)
        XCTAssertTrue(sut.movePiece(from: fromPosition, to: toPosition))
    }
}

// MARK: - Helpers
extension ChessGameTests {
    private func getExpectedRankString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        let pieces = sut.board[rank.rawValue - 1].compactMap { $0?.icon ?? "." }
        return rankString + pieces.joined()
    }
}
