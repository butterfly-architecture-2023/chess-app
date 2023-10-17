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
        
        self.sut = Board(pawnsManager: PawnsManagerImpl())
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
    
    func test_move_잘못된_턴() {
        self.sut.start()
        
        do {
            try self.sut.move(userInput: "A2->A3")
        } catch let error {
            XCTAssertEqual(error as! InputError, InputError.invalidTurn)
        }
    }
    
    func test_move_성공() {
        self.sut.start()
        
        try? self.sut.move(userInput: "A7->A6")
        XCTAssertEqual(self.sut.turnColor, .black)
    }
    
    func test_move_공격() {
        self.sut.start()
        try? self.sut.move(userInput: "A7->A6")
        try? self.sut.move(userInput: "A2->A3")
        try? self.sut.move(userInput: "A6->A5")
        try? self.sut.move(userInput: "A3->A4")
        try? self.sut.move(userInput: "A5->A4")
        
        XCTAssertEqual(self.sut.getScore(of: .black), 7)
    }
    
}
