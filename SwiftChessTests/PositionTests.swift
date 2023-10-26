//
//  PositionTests.swift
//  SwiftChessTests
//
//  Created by JK on 2022/06/23.
//

import XCTest

class PositionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_FileA_H_생성_정상() throws {
        let fileA = Position.File(with: "A")
        XCTAssertEqual(fileA, .A)
        let fileB = Position.File(with: "B")
        XCTAssertEqual(fileB, .B)
        let fileC = Position.File(with: "C")
        XCTAssertEqual(fileC, .C)
        let fileD = Position.File(with: "D")
        XCTAssertEqual(fileD, .D)
        let fileE = Position.File(with: "E")
        XCTAssertEqual(fileE, .E)
        let fileF = Position.File(with: "F")
        XCTAssertEqual(fileF, .F)
        let fileG = Position.File(with: "G")
        XCTAssertEqual(fileG, .G)
        let fileH = Position.File(with: "H")
        XCTAssertEqual(fileH, .H)
    }

    func test_FileX_비정상_실패() throws {
        let fileX = Position.File(with: "X")
        XCTAssertEqual(fileX, nil)
    }
    
    func test_FileA에서_FileH까지_거리_정상() throws {
        let fileA = Position.File(with: "A")
        let fileH = Position.File(with: "H")
        guard let a = fileA, let h = fileH else {
            XCTAssert(false, "file is nil!")
            return
        }
        XCTAssertEqual(a.distance(to: h), 7)
    }
    
    func test_FileA을_증가시키기_정상() throws {
        let fileA = Position.File(with: "A")
        guard let a = fileA else {
            XCTAssert(false, "file is nil!")
            return
        }
        let d = a.advanced(by: 3)
        XCTAssertEqual(d, .D)
        let g = d.advanced(by: 3)
        XCTAssertEqual(g, .G)
        let x = g.advanced(by: 2)
        XCTAssertEqual(x, nil)
    }
}

