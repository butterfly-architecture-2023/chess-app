//
//  KnightTests.swift
//  ChessAppTests
//
//  Created by Jiyeon  on 2023/10/23.
//

import XCTest
@testable import ChessApp

final class KnightTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_D5위치의_Knight가_움직일_수_있는_모든_위치() {
        let knight = Knight(color: .white)
        let movablePositions = knight.getMovableAllPositions(from: .init(rank: .five, file: .D))
        
        let expectedResult: Set<Position> = [
            .init(rank: .three, file: .C),
            .init(rank: .three, file: .E),
            .init(rank: .four, file: .B),
            .init(rank: .four, file: .F),
            .init(rank: .six, file: .B),
            .init(rank: .six, file: .F),
            .init(rank: .seven, file: .C),
            .init(rank: .seven, file: .E)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
