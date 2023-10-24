//
//  BoardTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/18.
//

import XCTest
@testable import ChessApp

final class BoardTests: XCTestCase {
    private var sut: Board!
    
    override func setUp() {
        super.setUp()
        
        self.sut = Board(pawnsManager: PawnsManagerImpl())
    }
    
    func test_Board생성후_display_확인() {
        let displayedBoards = self.sut.display()
        
        XCTAssertTrue(displayedBoards[1].allSatisfy({ $0 == "♟" }))
        XCTAssertTrue(displayedBoards[6].allSatisfy({ $0 == "♙" }))
    }
    
    func test_Board생성후__성공케이스_호출후_score_확인() {
        let scoreByBlack = self.sut.getScore(of: .black)
        let scoreByWhite = self.sut.getScore(of: .white)
        
        XCTAssertEqual(scoreByBlack, 8)
        XCTAssertEqual(scoreByWhite, 8)
    }
    
    func test_move메서드_성공케이스_이동이_성공했을_때() {
        try? self.sut.move(from: Position(file: .A, rank: .seven),
                           to: Position(file: .A, rank: .six))
        XCTAssertEqual(self.sut.turnColor, .black)
    }
    
    func test_move메서드_성공케이스_싱대방_말을_잡을수_있는지_테스트() {
        try? self.sut.move(from: Position(file: .A, rank: .seven),
                           to: Position(file: .A, rank: .six))
        
        try? self.sut.move(from: Position(file: .A, rank: .two),
                           to: Position(file: .A, rank: .three))
        
        try? self.sut.move(from: Position(file: .A, rank: .six),
                           to: Position(file: .A, rank: .five))
        
        try? self.sut.move(from: Position(file: .A, rank: .three),
                           to: Position(file: .A, rank: .four))
        
        try? self.sut.move(from: Position(file: .A, rank: .five),
                           to: Position(file: .A, rank: .four))
        
        XCTAssertEqual(self.sut.getScore(of: .black), 7)
    }
    
    func test_move메서드_실패케이스_잘못된_턴인_경우_테스트() {
        do {
            try self.sut.move(from: Position(file: .A, rank: .two),
                              to: Position(file: .A, rank: .three))
        } catch let error {
            XCTAssertEqual(error as! ValidationError, ValidationError.invalidTurn)
        }
    }
    
    func test_move메서드_실패케이스_source위치에_말이_없을때_테스트() {
        do {
            try self.sut.move(from: Position(file: .A, rank: .five),
                              to: Position(file: .A, rank: .three))
        } catch let error {
            XCTAssertEqual(error as! ValidationError, ValidationError.sourceNotExist)
        }
    }
    
    func test_move메서드_실패케이스_destination위치에_갈수_없을_때_테스트() {
        do {
            try self.sut.move(from: Position(file: .A, rank: .seven),
                              to: Position(file: .A, rank: .five))
        } catch let error {
            XCTAssertEqual(error as! ValidationError, ValidationError.invalidScope)
        }
    }
    
}
