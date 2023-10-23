//
//  BoardTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/18.
//

import XCTest
@testable import ChessApp

final class BoardTests: XCTestCase {
    var sut: Board!
    
    override func setUp() {
        super.setUp()
        
        self.sut = Board(inputManager: InputManager(separator: "->"), pawnsManager: PawnsManagerImpl())
    }
    
    func test_start메서드_호출후_display_확인() {
        self.sut.start()
        let displayedBoards = self.sut.display()
        
        XCTAssertTrue(displayedBoards[1].allSatisfy({ $0 == "♟" }))
        XCTAssertTrue(displayedBoards[6].allSatisfy({ $0 == "♙" }))
    }
    
    func test_start메서드_호출후_score_확인() {
        self.sut.start()
        let scoreByBlack = self.sut.getScore(of: .black)
        let scoreByWhite = self.sut.getScore(of: .white)
        
        XCTAssertEqual(scoreByBlack, 8)
        XCTAssertEqual(scoreByWhite, 8)
    }
    
    func test_move_잘못된_턴인_경우_테스트() {
        self.sut.start()
        
        do {
            try self.sut.move(userInput: "A2->A3")
        } catch let error {
            XCTAssertEqual(error as! ValidationError, ValidationError.invalidTurn)
        }
    }
    
    func test_move_이동이_성공했을_때() {
        self.sut.start()
        
        try? self.sut.move(userInput: "A7->A6")
        XCTAssertEqual(self.sut.turnColor, .black)
    }
    
    func test_move_싱대방_말을_잡을수_있는지_테스트() {
        self.sut.start()
        try? self.sut.move(userInput: "A7->A6")
        try? self.sut.move(userInput: "A2->A3")
        try? self.sut.move(userInput: "A6->A5")
        try? self.sut.move(userInput: "A3->A4")
        try? self.sut.move(userInput: "A5->A4")
        
        XCTAssertEqual(self.sut.getScore(of: .black), 7)
    }
    
}
