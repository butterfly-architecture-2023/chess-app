//
//  BoardTests.swift
//  ChessAppTests
//
//  Created by 현기엽 on 2023/10/15.
//

import XCTest
@testable import ChessApp

final class BoardTests: XCTestCase {
    func test초기상태의_검정색_점수는_8이다() {
        let board = Board(pieces: initialPieces)
        
        let whiteScore = board.score(for: .white)
        let blackScore = board.score(for: .black)
        
        XCTAssertEqual(whiteScore, 8)
        XCTAssertEqual(blackScore, 8)
    }
    
    func test빈_Board의_점수를_계산할_수_있다() {
        let board = Board(pieces: [])
        
        let whiteScore = board.score(for: .white)
        let blackScore = board.score(for: .black)
        
        XCTAssertEqual(whiteScore, 0)
        XCTAssertEqual(blackScore, 0)
    }
    
    func testA6가_빈칸일때_A7에_있는_백색Pawn을_A6으로_옮길_수_있다() {
        var board = Board(pieces: [
            Pawn(color: .white, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A6")
        XCTAssertTrue(result)
        XCTAssertTrue(board.pieces["A6"]?.color == .white)
        XCTAssertNil(board.pieces["A7"])
    }
    
    func testA6에_흑색Pawn이_있을때_A7에_있는_백색Pawn을_A6으로_옮길_수_있다() {
        var board = Board(pieces: [
            Pawn(color: .black, position: "A6"),
            Pawn(color: .white, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A6")
        XCTAssertTrue(result)
        XCTAssertTrue(board.pieces["A6"]?.color == .white)
        XCTAssertNil(board.pieces["A7"])
    }
    
    func testA6에_백색Pawn이_있을때_A7에_있는_백색Pawn을_A6으로_옮길_수_없다() {
        var board = Board(pieces: [
            Pawn(color: .white, position: "A6"),
            Pawn(color: .white, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A6")
        XCTAssertFalse(result)
    }
    
    func testA7에_있는_백색Pawn을_A5으로_옮길_수_없다() {
        var board = Board(pieces: [
            Pawn(color: .white, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A5")
        XCTAssertFalse(result)
    }
    
    func testA7에_있는_백색Pawn을_A8으로_옮길_수_없다() {
        var board = Board(pieces: [
            Pawn(color: .white, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A8")
        XCTAssertFalse(result)
    }
    
    func testA7에_있는_흑색Pawn을_A6으로_옮길_수_없다() {
        var board = Board(pieces: [
            Pawn(color: .black, position: "A7")
        ])
        let result = board.move(from: "A7", to: "A6")
        XCTAssertFalse(result)
    }
    
    private var initialPieces: [Piece] {
        return (0..<8).flatMap { (i: Int) in
            let file = String(UnicodeScalar(65 + i)!) // "A" + i
            return [
                Pawn(color: .black, position: .init(stringLiteral: "\(file)2")),
                Pawn(color: .white, position: .init(stringLiteral: "\(file)6"))
            ].compactMap { $0 }
        }
    }
}

extension Position: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)!
    }
}
