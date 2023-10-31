//
//  PieceTests.swift
//  ChessGameTests
//
//  Created by 오킹 on 2023/10/18.
//

import XCTest
@testable import ChessGame

final class PieceTests: XCTestCase {

    func testMovablePositions_검은_폰의_위치가_file_0_rank_0_일_때_file_0_rank_1_이_포함된_배열_반환() {
        let position = Position(file: 0, rank: 0)!
        let pawn = BlackPawn()
        let movablePositions = pawn.movablePositions(current: position)
        let target = [Position(file: 0, rank: 1)]

        XCTAssertEqual(movablePositions, target)
    }

    func testMovablePositions_하얀_폰의_위치가_file_7_rank_7_일_때_file_7_rank_6_이_포함된_배열_반환() {
        let position = Position(file: 7, rank: 7)!
        let sut = WhitePawn()
        let positions = sut.movablePositions(current: position)
        let target = Position(file: 7, rank: 6)!

        XCTAssertTrue(positions.contains{ $0 == target })
    }

    func testMovablePositions_검은_비숍의_위치가_file_0_rank_0_일_때_아래_오른쪽_대각선_위치들의_배열_반환() {
        let position = Position(file: 0, rank: 0)!
        let pawn = BlackBiship()
        let movablePositions = pawn.movablePositions(current: position)

        print(movablePositions)
        
        let target: [Position] = 
        [
            Position(file: 1, rank: 1)!,
            Position(file: 2, rank: 2)!,
            Position(file: 3, rank: 3)!,
            Position(file: 4, rank: 4)!,
            Position(file: 5, rank: 5)!,
            Position(file: 6, rank: 6)!,
            Position(file: 7, rank: 7)!
        ]
        
        XCTAssertTrue(movablePositions.contains(target),
                      "\(target)과 \n \(movablePositions)은 서로 다릅니다.")
    }
    
    func testMovablePositions_하얀_비숍의_위치가_file_7_rank_7_일_때_위_왼쪽_대각선_위치들의_배열_반환() {
        let position = Position(file: 7, rank: 7)!
        let sut = WhiteBiship()
        let movablePositions = sut.movablePositions(current: position)

        let target: [Position] = 
        [
            Position(file: 6, rank: 6)!,
            Position(file: 5, rank: 5)!,
            Position(file: 4, rank: 4)!,
            Position(file: 3, rank: 3)!,
            Position(file: 2, rank: 2)!,
            Position(file: 1, rank: 1)!,
            Position(file: 0, rank: 0)!
        ]

        XCTAssertTrue(movablePositions.contains(target),
                      "\(target)과 \n \(movablePositions)은 서로 다릅니다.")
    }
}
