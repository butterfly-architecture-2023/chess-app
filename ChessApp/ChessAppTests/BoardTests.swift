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
        let scoreByBlack = self.sut.generateScore(of: .black)
        let scoreByWhite = self.sut.generateScore(of: .white)
        
        XCTAssertEqual(scoreByBlack, 8)
        XCTAssertEqual(scoreByWhite, 8)
    }
}
