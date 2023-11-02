//
//  BoardManagerTests.swift
//  Chess_gameTests
//
//  Created by 박진섭 on 10/26/23.
//

import XCTest
@testable import Chess_game

final class BoardManagerTests: XCTestCase {

    var sut: Board!

    func test_getCurrentTeamScores_말의_생존유무와_타입에_따라_스코어가_계산이_되는가() {
        let blackPawn = BlackPawn(position: .init(rank: .one, file: .A)) // 1
        let whitePawn = WhitePawn(position: .init(rank: .two, file: .B))

        let blackKnight = BlackKnight(position: .init(rank: .three, file: .A)) // 3
        let whiteKnight = WhiteKnight(position: .init(rank: .four, file: .B))

        let blackBishop = BlackBishop(position: .init(rank: .five, file: .A)) // 3
        let whiteBishop = WhiteBishop(position: .init(rank: .six, file: .B))

        let blackRook = BlackRook(position: .init(rank: .seven, file: .A)) // 5
        let whiteRook = WhiteRook(position: .init(rank: .eight, file: .B))

        let blackQueen = BlackQueen(position: .init(rank: .one, file: .C)) // 9
        let whiteQueen = WhiteQueen(position: .init(rank: .two, file: .B))

        sut = ChessBoard.init([
            blackPawn, whitePawn,
            blackKnight, whiteKnight,
            blackBishop, whiteBishop,
            blackRook, whiteRook,
            blackQueen, whiteQueen
        ])

        let defaultTeamScore = TeamScore.init(black: 0, white: 0)
        XCTAssertEqual(sut.getCurrentTeamScores(), defaultTeamScore)

         1
        let blackPawn_1 = BlackPawn(isAlive: false, position: .init(rank: .one, file: .A))
        let whitePawn_1 = WhitePawn(position: .init(rank: .two, file: .B))

        // 3
        let blackKnight_1 = BlackKnight(position: .init(rank: .three, file: .A))
        let whiteKnight_1 = WhiteKnight(isAlive: false, position: .init(rank: .four, file: .B))

        // 3
        let blackBishop_1 = BlackBishop(isAlive: false, position: .init(rank: .five, file: .A))
        let whiteBishop_1 = WhiteBishop(position: .init(rank: .six, file: .B))

        // 5
        let blackRook_1 = BlackRook(position: .init(rank: .seven, file: .A))
        let whiteRook_1 = WhiteRook(isAlive: false, position: .init(rank: .eight, file: .B))

        // 9
        let blackQueen_1 = BlackQueen(isAlive: false, position: .init(rank: .one, file: .C))
        let whiteQueen_1 = WhiteQueen(position: .init(rank: .two, file: .B))

        sut = ChessBoard.init([
            blackPawn_1, whitePawn_1,
            blackKnight_1, whiteKnight_1,
            blackBishop_1, whiteBishop_1,
            blackRook_1, whiteRook_1,
            blackQueen_1, whiteQueen_1
        ])

        let expectedTeamScore = TeamScore.init(black: 8, white: 13)
        XCTAssertEqual(sut.getCurrentTeamScores(), expectedTeamScore)
    }

}
