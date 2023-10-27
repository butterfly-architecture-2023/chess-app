//
//  PieceManagerTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/25/23.
//

import XCTest
@testable import Chess_game

final class PieceManagerTests: XCTestCase {
    var sut: PieceManager!
    override func setUpWithError() throws {
        sut = .init([])
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_move_움직인결과에_따라_piece의_position이_적절히_달라졌는가() {
        // 움직이지 못함
        // 움직임
        // 잡으면서 움직임
    }

}
