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
    
    func test_display함수는_1rank부터_8rank까지_문자열_배열로_체스말을_리턴하는지() {
        let display = sut.display()
        let displayLines = display.components(separatedBy: "\n").dropLast()
        
        XCTAssertEqual(displayLines.count, 8)
        
        for rank in 0..<displayLines.count {
            let rankString = getExpectedRowString(forRank: Rank.allCases[rank])
            XCTAssertEqual(displayLines[rank], rankString)
        }
    }
    
    func test_초기화_1과2rank는_흑백_체스말_7과8rank는_백색_체스말이_위치하는지() {
        for rank in Rank.allCases {
            for file in File.allCases {
                let position = Position(rank: rank, file: file)
                let piece = sut.pieces[position]
                
                let expectedColor: Color
                if rank == .one || rank == .two {
                    expectedColor = .black
                } else if rank == .seven || rank == .eight {
                    expectedColor = .white
                } else {
                    continue
                }
                
                XCTAssertNotNil(piece)
                XCTAssertEqual(piece?.color, expectedColor)
            }
        }
    }
    
    func test_현재_턴의_체스말과_움직이려는_체스말의_색상이_동일한지() {
        let currentTurn = sut.currentPlayer
        let fromPosition = Position(rank: .seven, file: .a)
        
        if let fromPiece = sut.pieces[fromPosition] {
            XCTAssertTrue(currentTurn == fromPiece.color)
        }
    }
    
    func test_to위치에_같은_색상의_채스말이_있으면_옮길_수_없는지() {
        let fromPosition = Position(rank: .eight, file: .a)
        let toPosition = Position(rank: .seven, file: .a)
        XCTAssertFalse(sut.canMove(from: fromPosition, to: toPosition))
    }

    func test_백색은_큰_rank에서_작은_rank로_이동하는지() {
        sut.currentPlayer = .white

        let fromPosition = Position(rank: .seven, file: .a)
        let toPosition = Position(rank: .six, file: .a)
        XCTAssertTrue(sut.canMove(from: fromPosition, to: toPosition))
    }

    func test_흑색은_작은_rank에서_큰_rank로_이동하는지() {
        sut.currentPlayer = .black

        let fromPosition = Position(rank: .two, file: .a)
        let toPosition = Position(rank: .three, file: .a)
        XCTAssertTrue(sut.canMove(from: fromPosition, to: toPosition))
    }
}

// MARK: - Helpers
extension ChessGameTests {
    private func getExpectedRowString(forRank rank: Rank) -> String {
        let rankString = "\(rank.rawValue)"
        var pieces = ""

        for file in File.allCases {
            let position = Position(rank: rank, file: file)
            if let piece = sut.pieces[position] {
                pieces.append(piece.icon.unicode)
            } else {
                pieces.append(".")
            }
        }
        return rankString + pieces
    }
}
