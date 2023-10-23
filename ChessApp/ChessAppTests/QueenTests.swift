//
//  QueenTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class QueenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_F5위치의_Queen이_움직일_수_있는_모든_위치_확인() {
        let queen = Queen(color: .black)
        let movablePositions = queen.getMovablePositions(from: .init(rank: .five, file: .F))
        
        let expectedResult: Set<Position> = [
            .init(rank: .one, file: .B),
            .init(rank: .one, file: .F),
            .init(rank: .two, file: .C),
            .init(rank: .two, file: .F),
            .init(rank: .three, file: .D),
            .init(rank: .three, file: .F),
            .init(rank: .three, file: .H),
            .init(rank: .four, file: .E),
            .init(rank: .four, file: .F),
            .init(rank: .four, file: .G),
            .init(rank: .five, file: .A),
            .init(rank: .five, file: .B),
            .init(rank: .five, file: .C),
            .init(rank: .five, file: .D),
            .init(rank: .five, file: .E),
            .init(rank: .five, file: .G),
            .init(rank: .five, file: .H),
            .init(rank: .six, file: .E),
            .init(rank: .six, file: .F),
            .init(rank: .six, file: .G),
            .init(rank: .seven, file: .D),
            .init(rank: .seven, file: .F),
            .init(rank: .seven, file: .H),
            .init(rank: .eight, file: .C),
            .init(rank: .eight, file: .F)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
