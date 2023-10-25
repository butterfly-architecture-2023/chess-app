//
//  MapManagerTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/25/23.
//

import XCTest
@testable import Chess_game

final class MapManagerTests: XCTestCase {
    var sut: MapManager!

    override func setUpWithError() throws {
        sut = MapManager()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_display_체스말이_하나도_없을때()  {
        let map = sut.makeMap([])
        let expectedMap: [[String]] = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."]]
        XCTAssertEqual(map, expectedMap)
    }

    func test_display_기본_체스말_세팅되었을때() {
        let defaultChessPieces = PieceFactory.createPieces(.chess)
        let map = sut.makeMap(defaultChessPieces)
        let expectedMap: [[String]] =
        [["♜", "♞", "♝", ".", "♛", "♝", "♞", "♜"],
         ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
         [".", ".", ".", ".", ".", ".", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", "."],
         ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
         ["♖", "♘", "♗", ".", "♕", "♗", "♘", "♖"]]
        XCTAssertEqual(map, expectedMap)
    }

}
