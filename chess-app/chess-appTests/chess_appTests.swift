//
//  chess_appTests.swift
//  chess-appTests
//
//  Created by Jihee hwang on 2023/10/15.
//

import XCTest

final class chess_appTests: XCTestCase {
    private var sut: Board!
    
    override func setUpWithError() throws {
        sut = Board()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_보드_잘_생성되었는지() {
        let mockBoard = [[".", ".", ".", ".", ".", ".", ".", "."],
                         ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
                         [".", ".", ".", ".", ".", ".", ".", "."]]
        let testBoard = sut.display()
        XCTAssertEqual(mockBoard, testBoard)
    }
    
    func test_폰의_이동_가능_여부가_정상적인지() {
        let from: Position = .init(rank: .seven, file: .A)
        let to: Position = .init(rank: .five, file: .A)
        
        let canMove = sut.validateMovableRange(piece: .init(type: .pawn, color: .white),
                                               from: from,
                                               to: to)
        
        XCTAssertEqual(canMove, false)
    }
    
    func test_폰의_이동_가능_여부가_정상적인지2() {
        let from: Position = .init(rank: .one, file: .A)
        let to: Position = .init(rank: .two, file: .A)
        
        let canMove = sut.validateMovableRange(piece: .init(type: .pawn, color: .black),
                                               from: from,
                                               to: to)
        
        XCTAssertEqual(canMove, true)
    }
    
    func test_말을_잡았는지() {
        let mockBoard = [[".", ".", ".", ".", ".", ".", ".", "."],
                         [".", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         ["♙", ".", ".", ".", ".", ".", ".", "."],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         [".", ".", ".", ".", ".", ".", ".", "."],
                         [".", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
                         [".", ".", ".", ".", ".", ".", ".", "."]]
        sut.movePiece(piece: .init(type: .pawn, color: .white),
                      from: .init(rank: .seven, file: .A),
                      to: .init(rank: .six, file: .A))
        
        sut.movePiece(piece: .init(type: .pawn, color: .black),
                      from: .init(rank: .two, file: .A),
                      to: .init(rank: .three, file: .A))
        
        sut.movePiece(piece: .init(type: .pawn, color: .white),
                      from: .init(rank: .six, file: .A),
                      to: .init(rank: .five, file: .A))
        
        sut.movePiece(piece: .init(type: .pawn, color: .black),
                      from: .init(rank: .three, file: .A),
                      to: .init(rank: .four, file: .A))
        
        sut.movePiece(piece: .init(type: .pawn, color: .white),
                      from: .init(rank: .five, file: .A),
                      to: .init(rank: .four, file: .A))
        
        let testBoard = sut.display()
        XCTAssertEqual(mockBoard, testBoard)
    }
}
