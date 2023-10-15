//
//  Chess_gameTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/13/23.
//

import XCTest
@testable import Chess_game

final class Chess_gameTests: XCTestCase {
    var sut: Board!

    override func setUpWithError() throws {
        sut = Board()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testResetPawns() throws {
        
    }

    

}
