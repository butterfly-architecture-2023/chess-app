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
