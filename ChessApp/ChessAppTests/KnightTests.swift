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
    
    func test_더_큰_rank로의_전진만_가능한_경우() {
        let knight = Knight(color: .white)
        let movablePositions = knight.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [.init(rank: .five, file: .D)])
        
        let expectedResult: Set<Position> = [
            .init(rank: .six, file: .C),
            .init(rank: .six, file: .E)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
    
    func test_더_작은_rank로의_전진만_가능한_경우() {
        let knight = Knight(color: .white)
        let movablePositions = knight.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [.init(rank: .three, file: .D)])
        
        let expectedResult: Set<Position> = [
            .init(rank: .two, file: .C),
            .init(rank: .two, file: .E)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
    
    func test_더_큰_file로의_전진만_가능한_경우() {
        let knight = Knight(color: .white)
        let movablePositions = knight.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [.init(rank: .four, file: .E)])
        
        let expectedResult: Set<Position> = [
            .init(rank: .five, file: .F),
            .init(rank: .three, file: .F)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
    
    func test_더_작은_file로의_전진만_가능한_경우() {
        let knight = Knight(color: .white)
        let movablePositions = knight.getMovableAllPositions(from: .init(rank: .four, file: .D), with: [.init(rank: .four, file: .C)])
        
        let expectedResult: Set<Position> = [
            .init(rank: .five, file: .B),
            .init(rank: .three, file: .B)
        ]
        
        XCTAssertEqual(movablePositions, expectedResult)
    }
}
